import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/base/base_page.dart';
import '../../../shared/model/model.dart';
import '../../../shared/util/hex_to_color.dart';
import '../../../shared/widget/bottom_sheet_pack/bottom_sheet_pack.dart';
import '../provider/home_provider.dart';
import '../provider/note_provider.dart';
import '../provider/notebooks_provider.dart';
import '../widget/note_tile.dart';
import 'home_left_navigation.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key, required this.userInfo});

  final UserModel userInfo;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends BasePage<HomePage> {
  String appBarTitle = 'All Notes';
  String notebookID = '';

  UserModel get _userInfo => widget.userInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildNavigationDrawer(),
      floatingActionButton: _buildFloatingButton(),
      body: _buildNotesList(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      title: Text(appBarTitle),
      actions: <Widget>[
        if (notebookID.isNotEmpty)
          IconButton(
            onPressed: () async {
              CustomBottomSheet.notebookActions(
                context: context,
                onDeleteTap: () {
                  ref
                      .read(notebooksProvider.notifier)
                      .deletingNotebook(notebookID)
                      .then((value) {
                    fetchAllNotes();
                  });
                },
              );
            },
            icon: const Icon(Icons.more_vert),
          )
      ],
    );
  }

  Widget _buildNavigationDrawer() {
    return HomeLeftNavigation(
      userInfo: _userInfo,
      onAllNotesTap: fetchAllNotes,
      onNotebookTap: fetchNotesByNotebook,
      onLogoutTap: () {
        ref.read(homeProvider.notifier).logout();
      },
    );
  }

  Widget _buildFloatingButton() {
    return FloatingActionButton(
      onPressed: () async {
        final editorPopValue = await router.push<EditorPopValue>(
          MarkdownEditorRoute(
            note: const NoteModel(markdownNote: '', name: ''),
          ),
        );

        await ref.read(notesProvider.notifier).createNote(
              noteName: editorPopValue?.noteName ?? '',
              markdownNote: editorPopValue?.markdownNote ?? '',
              notebookID: notebookID,
            );
      },
      child: const Icon(Icons.add),
    );
  }

  Widget _buildNotesList() {
    final notesState = ref.watch(notesProvider);

    return notesState.when(
      loading: () {
        return Center(
          child: CircularProgressIndicator(
            color: HexColor('#474E68'),
          ),
        );
      },
      notesLoaded: (notes) {
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            final note = notes[index];

            return NoteTile(
              note: note,
              noteNameStyle: typoTheme.s15w700style(),
              noteCreatedDateStyle: typoTheme.s12w500style(color: Colors.blue),
              noteMarkdownStyle: typoTheme.s12w500style(),
              noteTagStyle: typoTheme.s12w500style(),
              noteOnTap: () async {
                final editorPopValue = await router.push<EditorPopValue>(
                  MarkdownEditorRoute(
                    note: note,
                    notebookID: notebookID,
                  ),
                );

                if (note.id != null &&
                    editorPopValue != null &&
                    (editorPopValue.markdownNote != note.markdownNote ||
                        editorPopValue.noteName != note.name)) {
                  await ref.read(notesProvider.notifier).updateNote(
                        note.id!,
                        editorPopValue.noteName!,
                        editorPopValue.markdownNote!,
                      );
                }
              },
            );
          },
        );
      },
      error: (error) {
        return Container();
      },
    );
  }

  void fetchAllNotes() {
    setState(() {
      appBarTitle = 'All Notes';
      notebookID = '';
    });
    ref.read(notesProvider.notifier).fetchNotes();
  }

  void fetchNotesByNotebook(NotebookModel notebook) {
    setState(() {
      appBarTitle = notebook.name;
      notebookID = notebook.id;
    });
    if (notebookID.isNotEmpty) {
      ref.read(notesProvider.notifier).fetchByNotebook(notebookID);
    }
  }
}
