import 'package:flutter/material.dart';

import '../../util/hex_to_color.dart';

class AddingNotebookDialog extends StatefulWidget {
  const AddingNotebookDialog({super.key, this.onAddingNotebook});

  final ValueChanged<String>? onAddingNotebook;

  @override
  State<AddingNotebookDialog> createState() => _AddingNotebookDialogState();
}

class _AddingNotebookDialogState extends State<AddingNotebookDialog> {
  String newNotebookName = '';
  ValueChanged<String>? get onAddingNotebook => widget.onAddingNotebook;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 150,
        width: 120,
        child: Column(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              height: 40,
              color: HexColor('#404258'),
              child: const Center(
                child: Text(
                  'Adding Notebook',
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
              onChanged: (value) => newNotebookName = value,
            ),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                onAddingNotebook?.call(newNotebookName);
                Navigator.pop(context);
              },
              child: const Text('Okay'),
            )
          ],
        ),
      ),
    );
  }
}
