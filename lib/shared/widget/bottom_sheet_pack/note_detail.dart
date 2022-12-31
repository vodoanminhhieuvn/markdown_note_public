import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../feature/home/provider/note_provider.dart';
import '../../base/base_page.dart';
import '../../model/model.dart';
import '../../util/hex_to_color.dart';
import 'bottom_sheet_pack.dart';

class NoteDetailSheet extends ConsumerStatefulWidget {
  const NoteDetailSheet({
    super.key,
    required this.note,
    this.notebookID,
    this.onDeleteTap,
  });

  final NoteModel note;
  final String? notebookID;
  final VoidCallback? onDeleteTap;

  @override
  NoteDetailSheetState createState() => NoteDetailSheetState();
}

class NoteDetailSheetState extends BasePage<NoteDetailSheet> {
  late NoteModel note;

  String? get _notebookID => widget.notebookID;
  VoidCallback? get _onDeleteTap => widget.onDeleteTap;

  @override
  void initState() {
    note = widget.note;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#474E68'),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop<NoteModel>(context, note);
            },
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            'Information',
            style: typoTheme.s15w700style(),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 10),
          _buildNotebookTile(),
          const Divider(),
          _buildStatusTile(),
          const Divider(),
          ..._buildListTagTile(),
          const Divider(),
          _buildAddTagButton(),
          const Divider(),
          ..._buildListTimeTile(),
          const Divider(),
          _buildDeleteButton()
        ],
      ),
    );
  }

  Widget _buildNotebookTile() {
    return ListTile(
      onTap: () {
        CustomBottomSheet.changeNotebook(
          context: context,
          notebook: note.notebook,
          onNotebooktap: (newNotebook) {
            setState(() {
              note = note.copyWith(notebook: newNotebook);
            });
            ref.read(notesProvider.notifier).updateNotebook(note, _notebookID);
          },
        );
      },
      tileColor: Colors.white,
      title: const Text('Notebook'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(note.notebook?.name ?? ''),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios, size: 14)
        ],
      ),
    );
  }

  Widget _buildStatusTile() {
    var noteStatus = 'None';

    if (note.status != null && note.status!.isNotEmpty) {
      noteStatus = note.status!;
    }

    return ListTile(
      onTap: () {
        CustomBottomSheet.changeStatus(
          context: context,
          onStatusTap: (status) {
            setState(() {
              note = note.copyWith(status: status);
            });
            ref.read(notesProvider.notifier).updateStatus(note);
          },
        );
      },
      tileColor: Colors.white,
      title: const Text('Status'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(noteStatus),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios, size: 14)
        ],
      ),
    );
  }

  List<Widget> _buildListTagTile() {
    return note.tags
            ?.map(
              (tag) => ListTile(
                tileColor: Colors.white,
                title: Row(
                  children: <Widget>[
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: HexColor(tag.color),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(tag.name),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    final tagRecords = note.tags?.toList();
                    tagRecords
                        ?.removeWhere((tagRecord) => tagRecord.id == tag.id);
                    setState(() {
                      note = note.copyWith(tags: tagRecords);
                    });
                    ref.read(notesProvider.notifier).updateTags(note);
                  },
                ),
              ),
            )
            .toList() ??
        [];
  }

  Widget _buildAddTagButton() {
    return MaterialButton(
      onPressed: () {
        CustomBottomSheet.addTag(
          context: context,
          listTagID: note.tags?.map((tag) => tag.id!).toList() ?? [],
          onTagTap: (tag) {
            final tagRecords = note.tags?.toList();
            tagRecords?.add(tag);
            setState(() {
              note = note.copyWith(tags: tagRecords);
            });
            ref.read(notesProvider.notifier).updateTags(note);
          },
        );
      },
      color: Colors.blue,
      child: const Text('Add Tags'),
    );
  }

  List<Widget> _buildListTimeTile() {
    return [
      ListTile(
        tileColor: Colors.white,
        title: const Text('Created date'),
        trailing: Text(
          note.createdAt?.toLocal().toString().substring(0, 19) ??
              '(Undefined}',
        ),
      ),
      ListTile(
        tileColor: Colors.white,
        title: const Text('Updated date'),
        trailing: Text(
          note.updatedAt?.toLocal().toString().substring(0, 19) ??
              '(Undefined}',
        ),
      ),
    ];
  }

  Widget _buildDeleteButton() {
    return MaterialButton(
      color: Colors.red,
      onPressed: () {
        Navigator.pop(context);
        _onDeleteTap?.call();
      },
      child: const Text('Delete note', style: TextStyle(color: Colors.white)),
    );
  }
}
