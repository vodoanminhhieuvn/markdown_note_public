import 'package:flutter/material.dart';

class TagActions extends StatelessWidget {
  const TagActions({
    super.key,
    this.onChangeNameTap,
    this.onDeleteTap,
  });

  final VoidCallback? onChangeNameTap;
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
            title: const Text('Change tag name'),
          ),
          ListTile(
            onTap: () {
              onDeleteTap?.call();
              Navigator.pop(context);
            },
            title: const Text(
              'Delete tag',
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
