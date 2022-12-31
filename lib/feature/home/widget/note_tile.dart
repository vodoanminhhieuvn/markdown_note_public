import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../shared/constants/status_type.dart';
import '../../../shared/model/model.dart';
import '../../../shared/util/hex_to_color.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({
    super.key,
    required this.note,
    this.noteNameStyle,
    this.noteCreatedDateStyle,
    this.noteMarkdownStyle,
    this.noteTagStyle,
    this.noteOnTap,
  });

  final NoteModel note;
  final TextStyle? noteNameStyle;
  final TextStyle? noteCreatedDateStyle;
  final TextStyle? noteMarkdownStyle;
  final TextStyle? noteTagStyle;
  final VoidCallback? noteOnTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: noteOnTap,
      child: Column(
        children: <Widget>[
          Container(
            height: 62,
            margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            child: Column(
              children: <Widget>[
                _buildNoteTitle(note.name!, note.status),
                SizedBox(
                  width: double.infinity,
                  height: 16,
                  child: _buildNoteBody(
                    timeago.format(note.createdAt!),
                    note.tags,
                  ),
                ),
                _buildMarkdownNote(note.markdownNote)
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildNoteTitle(String noteName, String? status) {
    return Row(
      children: <Widget>[
        if (status != null && status.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: _buildStatus(status),
          )
        else
          const SizedBox.shrink(),
        Text(
          noteName.isNotEmpty ? noteName : '(Undefined)',
          style: noteNameStyle,
        )
      ],
    );
  }

  Widget _buildStatus(String status) {
    switch (status) {
      case StatusType.active:
        {
          return const Icon(Icons.radio_button_unchecked, size: 18);
        }
      case StatusType.completed:
        {
          return const Icon(Icons.check_circle, color: Colors.green, size: 18);
        }
      case StatusType.onHold:
        {
          return const Icon(Icons.pause_circle, color: Colors.orange, size: 18);
        }
      case StatusType.dropped:
        {
          return const Icon(Icons.cancel, color: Colors.red, size: 18);
        }
    }

    return const SizedBox.shrink();
  }

  Widget _buildNoteBody(String? date, List<TagModel>? listTag) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        if (date != null)
          Text(
            date,
            style: noteCreatedDateStyle,
          ),
        if (listTag != null)
          ...listTag
              .map((tag) => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                    margin: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor(tag.color)),
                    child: Text(tag.name, style: noteTagStyle),
                  ))
              .toList()
      ],
    );
  }

  Widget _buildMarkdownNote(String? markdownNote) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        markdownNote?.replaceAll(RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), '\n') ??
            '',
        style: noteMarkdownStyle,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: TextAlign.left,
      ),
    );
  }
}
