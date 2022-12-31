import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/base/base_page.dart';
import '../../../shared/model/model.dart';
import '../../../shared/widget/bottom_sheet_pack/bottom_sheet_pack.dart';
import '../../../shared/widget/markdown_editor_pack/markdown_format.dart';
import '../../../shared/widget/markdown_editor_pack/markdown_text_input.dart';
import '../../home/provider/note_provider.dart';

class MarkdownEditorPage extends ConsumerStatefulWidget {
  const MarkdownEditorPage({
    super.key,
    required this.note,
    this.notebookID,
  });

  final NoteModel note;
  final String? notebookID;

  @override
  MarkdownEditorPageState createState() => MarkdownEditorPageState();
}

class MarkdownEditorPageState extends BasePage<MarkdownEditorPage> {
  TextEditingController editorController = TextEditingController();
  TextEditingController noteNameController = TextEditingController();
  FocusNode editorFocusNode = FocusNode();
  bool togglePreview = false;

  late NoteModel _note;

  String get markdownNote => widget.note.markdownNote ?? '';
  String get noteName => widget.note.name ?? '';
  String? get notebookID => widget.notebookID;

  @override
  void initState() {
    editorController.text = markdownNote;
    noteNameController.text = noteName;
    _note = widget.note;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            router.pop(
              EditorPopValue(
                noteName: noteNameController.text,
                markdownNote: editorController.text,
              ),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: switchCurrentViewType,
            icon: const Icon(Icons.visibility),
          ),
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () async {
              final noteRecord = await CustomBottomSheet.noteDetail(
                context: context,
                notebookID: notebookID,
                note: _note,
                onDeleteTap: () {
                  ref.read(notesProvider.notifier).deleteNote(_note.id);
                  router.pop();
                },
              );

              if (noteRecord != null) {
                setState(() {
                  _note = noteRecord;
                });
              }
            },
          )
        ],
      ),
      body: _buildContent(),
    );
  }

  Widget _buildEditor() {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
              child: TextField(
                controller: noteNameController,
                decoration:
                    const InputDecoration.collapsed(hintText: '(Undefined)'),
              ),
            ),
            const Divider(),
            Expanded(
              child: MarkdownTextInput(
                (text) {},
                editorController.text,
                label: 'Desciption',
                focusNode: editorFocusNode,
                maxLines: null,
                actions: MarkdownType.values,
                controller: editorController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMarkdown() {
    return ColoredBox(
      color: Colors.white,
      child: Markdown(
        data: editorController.text,
        selectable: true,
        styleSheetTheme: MarkdownStyleSheetBaseTheme.platform,
      ),
    );
  }

  Widget _buildContent() {
    return Stack(
      children: [
        _buildEditor(),
        Visibility(
          visible: togglePreview,
          child: _buildMarkdown(),
        ),
      ],
    );
  }

  void switchCurrentViewType() {
    togglePreview = !togglePreview;
    editorFocusNode.unfocus();
    setState(() {});
  }
}
