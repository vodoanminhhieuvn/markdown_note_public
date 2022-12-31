import 'package:flutter/material.dart';

import '../../Extensions/color_extension.dart';
import '../../util/hex_to_color.dart';
import 'dialog_widget_pack.dart';

class AddingTagDialog extends StatefulWidget {
  const AddingTagDialog({
    super.key,
    this.onAddingTag,
  });

  final void Function({required String name, required String color})?
      onAddingTag;

  @override
  State<AddingTagDialog> createState() => _AddingTagDialogState();
}

class _AddingTagDialogState extends State<AddingTagDialog> {
  String newTagName = '';
  Color newColor = const Color(0xfffff000);

  void Function({required String name, required String color})?
      get _onAddingTag => widget.onAddingTag;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 200,
        width: 120,
        child: Column(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              height: 40,
              color: HexColor('#404258'),
              child: const Center(
                child: Text(
                  'Addnig Tag',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration:
                  const InputDecoration.collapsed(hintText: 'Enter a name'),
              onChanged: (value) => newTagName = value,
            ),
            const SizedBox(height: 10),
            MaterialButton(
              color: newColor,
              onPressed: () {
                CustomDialog.colorPicker(
                  context: context,
                  onPickingColor: (color) {
                    setState(() {
                      newColor = color;
                    });
                  },
                );
              },
              child: const Text('Tag Color'),
            ),
            MaterialButton(
              color: HexColor('#404258'),
              onPressed: () {
                _onAddingTag?.call(name: newTagName, color: newColor.toHex());
                Navigator.pop(context);
              },
              child: const Text('Okay', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
