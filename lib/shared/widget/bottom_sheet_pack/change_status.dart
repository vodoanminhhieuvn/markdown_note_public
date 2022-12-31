import 'package:flutter/material.dart';

import '../../constants/status_type.dart';
import '../list_status_widget.dart';

class ChangeStatusSheet extends StatelessWidget {
  const ChangeStatusSheet({
    super.key,
    this.onStatusTap,
  });

  final ValueChanged<String>? onStatusTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListStatusWidget(
        activeUnderline: true,
        contentPadding: const EdgeInsets.only(left: 10),
        onNoneTap: () {
          onStatusTap?.call(StatusType.none);
          Navigator.pop(context);
        },
        onActiveTap: () {
          onStatusTap?.call(StatusType.active);
          Navigator.pop(context);
        },
        onCompletedTap: () {
          onStatusTap?.call(StatusType.completed);
          Navigator.pop(context);
        },
        onHoldTap: () {
          onStatusTap?.call(StatusType.onHold);
          Navigator.pop(context);
        },
        onDropTap: () {
          onStatusTap?.call(StatusType.dropped);
          Navigator.pop(context);
        },
      ),
    );
  }
}
