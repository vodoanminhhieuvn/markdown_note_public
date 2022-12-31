import 'package:flutter/material.dart';

import '../constants/status_type.dart';
import 'custom_tile_widget.dart';

class ListStatusWidget extends StatelessWidget {
  const ListStatusWidget({
    super.key,
    this.onNoneTap,
    this.onActiveTap,
    this.onHoldTap,
    this.onCompletedTap,
    this.onDropTap,
    this.contentPadding,
    this.tickActive,
    this.activeUnderline = false,
    this.enableNoneTile = true,
    this.currentStatus,
    this.textColor,
    this.activeColor,
  });

  final VoidCallback? onNoneTap;
  final VoidCallback? onActiveTap;
  final VoidCallback? onHoldTap;
  final VoidCallback? onCompletedTap;
  final VoidCallback? onDropTap;
  final EdgeInsetsGeometry? contentPadding;
  final bool? tickActive;
  final bool activeUnderline;
  final bool enableNoneTile;
  final String? currentStatus;
  final Color? textColor;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (enableNoneTile)
          CustomListTileWidget(
            onTap: onNoneTap,
            padding: contentPadding ?? const EdgeInsets.only(left: 26),
            children: const <Widget>[
              Text(StatusType.none, style: TextStyle(color: Colors.white))
            ],
          ),
        if (activeUnderline) const Divider(),
        CustomListTileWidget(
          onTap: onActiveTap,
          padding: contentPadding ?? const EdgeInsets.only(left: 26),
          children: <Widget>[
            Icon(
              Icons.radio_button_checked,
              size: 18,
              color: activeColor,
            ),
            const SizedBox(width: 12),
            Text(StatusType.active, style: TextStyle(color: textColor))
          ],
        ),
        if (activeUnderline) const Divider(),
        CustomListTileWidget(
          onTap: onHoldTap,
          padding: contentPadding ?? const EdgeInsets.only(left: 26),
          children: <Widget>[
            const Icon(
              Icons.pause_circle,
              size: 18,
              color: Colors.orange,
            ),
            const SizedBox(width: 12),
            Text(StatusType.onHold, style: TextStyle(color: textColor))
          ],
        ),
        if (activeUnderline) const Divider(),
        CustomListTileWidget(
          onTap: onCompletedTap,
          padding: contentPadding ?? const EdgeInsets.only(left: 26),
          children: <Widget>[
            const Icon(
              Icons.check_circle,
              size: 18,
              color: Colors.green,
            ),
            const SizedBox(width: 12),
            Text(StatusType.completed, style: TextStyle(color: textColor))
          ],
        ),
        if (activeUnderline) const Divider(),
        CustomListTileWidget(
          onTap: onDropTap,
          padding: contentPadding ?? const EdgeInsets.only(left: 26),
          children: <Widget>[
            const Icon(
              Icons.cancel,
              size: 18,
              color: Colors.red,
            ),
            const SizedBox(width: 12),
            Text(StatusType.dropped, style: TextStyle(color: textColor))
          ],
        ),
      ],
    );
  }
}
