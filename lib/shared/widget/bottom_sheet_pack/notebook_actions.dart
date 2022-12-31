import 'package:flutter/material.dart';

class NotebookActions extends StatelessWidget {
  const NotebookActions({
    super.key,
    this.onChangeNameTap,
    this.onMoveTap,
    this.onDeleteTap,
  });

  final VoidCallback? onChangeNameTap;
  final VoidCallback? onMoveTap;
  final VoidCallback? onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () {
              onChangeNameTap?.call();
              Navigator.pop(context);
            },
            //TODO I'n not gonna handle this because you know i'm lazy
            title: const Text('Change notebook name'),
          ),
          ListTile(
            onTap: () {
              onMoveTap?.call();
              Navigator.pop(context);
            },
            title: const Text('Move notebook'),
          ),
          ListTile(
            onTap: () {
              onDeleteTap?.call();
              Navigator.pop(context);
            },
            title: const Text(
              'Delete notebook',
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
