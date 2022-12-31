import 'package:flutter/material.dart';

import '../../model/model.dart';
import 'add_tag.dart';
import 'change_notebook.dart';
import 'change_status.dart';
import 'note_detail.dart';
import 'notebook_actions.dart';
import 'tag_actions.dart';

class CustomBottomSheet {
  static Future<NoteModel?> noteDetail({
    required BuildContext context,
    required NoteModel note,
    String? notebookID,
    VoidCallback? onDeleteTap,
  }) async {
    final notePopBack = await showModalBottomSheet<NoteModel>(
      context: context,
      isScrollControlled: true,
      builder: (context) => NoteDetailSheet(
        note: note,
        notebookID: notebookID,
        onDeleteTap: onDeleteTap,
      ),
    );

    return notePopBack;
  }

  static void changeNotebook({
    required BuildContext context,
    NotebookModel? notebook,
    ValueChanged<NotebookModel>? onNotebooktap,
  }) {
    showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      builder: (context) => ChangeNotebookSheet(
        notebook: notebook,
        onNotebookTap: onNotebooktap,
      ),
    );
  }

  static void changeStatus({
    required BuildContext context,
    ValueChanged<String>? onStatusTap,
  }) {
    showModalBottomSheet<dynamic>(
      context: context,
      builder: (context) => ChangeStatusSheet(
        onStatusTap: onStatusTap,
      ),
    );
  }

  static void addTag({
    required BuildContext context,
    required List<String> listTagID,
    ValueChanged<TagModel>? onTagTap,
  }) {
    showModalBottomSheet<dynamic>(
      context: context,
      builder: (context) => AddTagSheet(
        listTagID: listTagID,
        onTagTap: onTagTap,
      ),
    );
  }

  static void notebookActions({
    required BuildContext context,
    VoidCallback? onDeleteTap,
  }) {
    showModalBottomSheet<dynamic>(
      context: context,
      builder: (context) => NotebookActions(
        onDeleteTap: onDeleteTap,
      ),
    );
  }

  static void tagActions({
    required BuildContext context,
    VoidCallback? onDeleteTap,
  }) {
    showModalBottomSheet<dynamic>(
      context: context,
      builder: (context) => TagActions(onDeleteTap: onDeleteTap),
    );
  }
}
