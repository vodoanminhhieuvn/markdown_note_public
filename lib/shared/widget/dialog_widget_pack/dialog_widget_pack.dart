import 'package:flutter/material.dart';

import 'adding_notebook_dialog.dart';
import 'adding_tag_dialog.dart';
import 'color_picker_dialog.dart';

class CustomDialog {
  static void addingNotebook({
    required BuildContext context,
    ValueChanged<String>? onAddingNotebook,
  }) {
    showDialog<dynamic>(
      context: context,
      builder: (context) => AddingNotebookDialog(
        onAddingNotebook: onAddingNotebook,
      ),
    );
  }

  static void addingTag({
    required BuildContext context,
    void Function({required String name, required String color})? onAddingTag,
  }) {
    showDialog<dynamic>(
      context: context,
      builder: (context) => AddingTagDialog(
        onAddingTag: onAddingTag,
      ),
    );
  }

  static void colorPicker({
    required BuildContext context,
    ValueChanged<Color>? onPickingColor,
  }) {
    showDialog<dynamic>(
      context: context,
      builder: (context) => ColorPickerDialog(
        onPickingColor: onPickingColor,
      ),
    );
  }
}
