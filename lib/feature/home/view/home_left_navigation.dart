import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/base/base_page.dart';
import '../../../shared/constants/status_type.dart';
import '../../../shared/model/model.dart';
import '../../../shared/util/hex_to_color.dart';
import '../../../shared/widget/bottom_sheet_pack/bottom_sheet_pack.dart';
import '../../../shared/widget/custom_tile_widget.dart';
import '../../../shared/widget/dialog_widget_pack/dialog_widget_pack.dart';
import '../../../shared/widget/list_status_widget.dart';
import '../provider/note_provider.dart';
import '../provider/notebooks_provider.dart';
import '../provider/tags_provider.dart';

class HomeLeftNavigation extends ConsumerStatefulWidget {
  const HomeLeftNavigation({
    super.key,
    required this.userInfo,
    this.onAllNotesTap,
    this.onNotebookTap,
    this.onLogoutTap,
  });

  final UserModel userInfo;

  final VoidCallback? onAllNotesTap;
  final ValueChanged<NotebookModel>? onNotebookTap;
  final VoidCallback? onLogoutTap;

  @override
  HomeLeftNavigationState createState() => HomeLeftNavigationState();
}

class HomeLeftNavigationState extends BasePage<HomeLeftNavigation> {
  bool showSetting = false;

  UserModel get _userInfo => widget.userInfo;
  VoidCallback? get _onAllNotesTap => widget.onAllNotesTap;
  ValueChanged<NotebookModel>? get _onNotebookTap => widget.onNotebookTap;
  VoidCallback? get _onLogoutTap => widget.onLogoutTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: HexColor('#474E68'),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _builderHeader(context),
            Stack(
              children: <Widget>[
                _buildSettingActions(context),
                Visibility(
                  visible: !showSetting,
                  child: _buildMenuItems(context),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _builderHeader(BuildContext context) {
    return ColoredBox(
      color: HexColor('#404258'),
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              _userInfo.name,
              style: typoTheme.s16w500style(color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                setState(() => showSetting = !showSetting);
              },
              icon: Icon(
                showSetting ? Icons.arrow_circle_down : Icons.arrow_circle_up,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSettingActions(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        CustomListTileWidget(
          onTap: _onLogoutTap,
          children: const <Widget>[
            Icon(
              Icons.logout,
              color: Colors.white,
            ),
            SizedBox(width: 6),
            Text('Logout', style: TextStyle(color: Colors.white))
          ],
        )
      ],
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return ColoredBox(
      color: HexColor('#474E68'),
      child: Column(
        children: <Widget>[
          _buildAllNotesListTile(context),
          _buildNoteBookListTile(context),
          ..._buildListNotebooks(context),
          _buildStatusListTile(context),
          _buildListStatus(context),
          _buildTagListTile(context),
          ..._buildListTags(context),
        ],
      ),
    );
  }

  Widget _buildAllNotesListTile(BuildContext context) {
    return CustomListTileWidget(
      onTap: () {
        _onAllNotesTap?.call();
        Navigator.pop(context);
      },
      onLongPress: () {},
      margin: const EdgeInsets.symmetric(vertical: 8),
      children: const <Widget>[
        Icon(
          Icons.description_outlined,
          color: Colors.white,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          'All Notes',
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }

  Widget _buildNoteBookListTile(BuildContext context) {
    return CustomListTileWidget(
      onTap: () {},
      onLongPress: () {},
      margin: const EdgeInsets.symmetric(vertical: 8),
      children: <Widget>[
        const Icon(
          Icons.library_books_outlined,
          color: Colors.white,
        ),
        const SizedBox(
          width: 6,
        ),
        const Text(
          'Notebooks',
          style: TextStyle(color: Colors.white),
        ),
        const Spacer(),
        MaterialButton(
          onPressed: () {
            CustomDialog.addingNotebook(
              context: context,
              onAddingNotebook: (newNotebookName) {
                ref
                    .read(notebooksProvider.notifier)
                    .creatingNewNotebook(newNotebookName);
              },
            );
          },
          child: const Text(
            'Add',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  List<Widget> _buildListNotebooks(BuildContext context) {
    final notebookState = ref.watch(notebooksProvider);

    return notebookState.when(
      loading: () {
        return [
          const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        ];
      },
      notebooksLoaded: (notebooks) {
        return notebooks
            .map(
              (notebook) => CustomListTileWidget(
                onTap: () {
                  _onNotebookTap?.call(notebook);
                  Navigator.pop(context);
                },
                onLongPress: () {
                  CustomBottomSheet.notebookActions(
                    context: context,
                    onDeleteTap: () {
                      ref
                          .read(notebooksProvider.notifier)
                          .deletingNotebook(notebook.id)
                          .then((value) {
                        _onAllNotesTap?.call();
                      });
                    },
                  );
                },
                padding: const EdgeInsets.only(left: 52),
                children: <Widget>[
                  if (notebook.subNotebooks!.isNotEmpty)
                    const Icon(Icons.arrow_forward_ios, color: Colors.white)
                  else
                    const SizedBox.shrink(),
                  Text(
                    notebook.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
            .toList();
      },
      error: (error) {
        return [Container()];
      },
    );
  }

  Widget _buildStatusListTile(BuildContext context) {
    return const CustomListTileWidget(
      margin: EdgeInsets.symmetric(vertical: 8),
      children: <Widget>[
        Icon(
          Icons.description_outlined,
          color: Colors.white,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          'Status',
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }

  Widget _buildListStatus(BuildContext context) {
    return ListStatusWidget(
      onActiveTap: () {
        ref.read(notesProvider.notifier).fetchByStatus(StatusType.active);
        Navigator.pop(context);
      },
      onCompletedTap: () {
        ref.read(notesProvider.notifier).fetchByStatus(StatusType.completed);
        Navigator.pop(context);
      },
      onDropTap: () {
        ref.read(notesProvider.notifier).fetchByStatus(StatusType.dropped);
        Navigator.pop(context);
      },
      onHoldTap: () {
        ref.read(notesProvider.notifier).fetchByStatus(StatusType.onHold);
        Navigator.pop(context);
      },
      enableNoneTile: false,
      textColor: Colors.white,
    );
  }

  Widget _buildTagListTile(BuildContext context) {
    return CustomListTileWidget(
      onTap: () {},
      margin: const EdgeInsets.symmetric(vertical: 8),
      children: <Widget>[
        const Icon(
          Icons.sell_outlined,
          color: Colors.white,
        ),
        const SizedBox(
          width: 6,
        ),
        const Text(
          'Tag',
          style: TextStyle(color: Colors.white),
        ),
        const Spacer(),
        MaterialButton(
          onPressed: () {
            CustomDialog.addingTag(
              context: context,
              onAddingTag: ({required name, required color}) {
                if (name.isEmpty) return;

                ref.read(tagsProvider.notifier).createNewTag(name, color);
              },
            );
          },
          child: const Text(
            'Add',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  List<Widget> _buildListTags(BuildContext context) {
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
        return tags
            .map(
              (tag) => CustomListTileWidget(
                onLongPress: () {
                  CustomBottomSheet.tagActions(
                    context: context,
                    onDeleteTap: () {
                      ref
                          .read(tagsProvider.notifier)
                          .deletingTag(tag.id!)
                          .then((value) {
                        _onAllNotesTap?.call();
                      });
                    },
                  );
                },
                padding: const EdgeInsets.only(left: 26),
                children: <Widget>[
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: HexColor(tag.color),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(tag.name, style: const TextStyle(color: Colors.white))
                ],
              ),
            )
            .toList();
      },
      error: (error) {
        return [Container()];
      },
    );
  }
}
