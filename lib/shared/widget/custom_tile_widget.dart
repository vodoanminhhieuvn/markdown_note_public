import 'package:flutter/material.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({
    super.key,
    this.onTap,
    this.onLongPress,
    this.margin = const EdgeInsets.symmetric(vertical: 12),
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    required this.children,
  });

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        margin: margin,
        padding: padding,
        child: Row(
          children: children,
        ),
      ),
    );
  }
}
