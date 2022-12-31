import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerDialog extends StatelessWidget {
  const ColorPickerDialog({
    super.key,
    this.onPickingColor,
  });

  final ValueChanged<Color>? onPickingColor;

  @override
  Widget build(BuildContext context) {
    var colorPicker = const Color(0xfffff000);

    return AlertDialog(
      title: const Text('Pick a color!'),
      content: SingleChildScrollView(
        child: ColorPicker(
          pickerColor: colorPicker,
          onColorChanged: (colorValue) => colorPicker = colorValue,
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            onPickingColor?.call(colorPicker);
            Navigator.pop(context);
          },
          child: const Text('Done'),
        )
      ],
    );
  }
}
