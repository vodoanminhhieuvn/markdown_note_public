import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../feature/home/provider/tags_provider.dart';
import '../../base/base_page.dart';
import '../../model/model.dart';
import '../../util/hex_to_color.dart';

class AddTagSheet extends ConsumerStatefulWidget {
  const AddTagSheet({
    super.key,
    required this.listTagID,
    this.onTagTap,
  });

  final List<String> listTagID;
  final ValueChanged<TagModel>? onTagTap;

  @override
  AddTagSheetState createState() => AddTagSheetState();
}

class AddTagSheetState extends BasePage<AddTagSheet> {
  List<String> get _listTagID => widget.listTagID;
  ValueChanged<TagModel>? get _onTagTap => widget.onTagTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            'Information',
            style: typoTheme.s15w700style(),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 20),
          Text('SELECT TAG', style: typoTheme.s14w500style()),
          ..._buildTagList(context),
        ],
      ),
    );
  }

  List<Widget> _buildTagList(BuildContext context) {
    final tagsState = ref.watch(tagsProvider);

    return tagsState.when(
      loading: () {
        return [
          const Center(
            child: CircularProgressIndicator(),
          )
        ];
      },
      tagsLoaded: (tags) {
        return tags.map((tag) {
          if (!_listTagID.contains(tag.id)) {
            return ListTile(
              onTap: () {
                _onTagTap?.call(tag);
                Navigator.pop(context);
              },
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: HexColor(tag.color),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(tag.name)
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        }).toList();
      },
      error: (error) {
        return [Container()];
      },
    );
  }
}
