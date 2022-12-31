import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../feature/home/provider/notebooks_provider.dart';
import '../../base/base_page.dart';
import '../../model/model.dart';

class ChangeNotebookSheet extends ConsumerStatefulWidget {
  const ChangeNotebookSheet({super.key, this.notebook, this.onNotebookTap});

  final NotebookModel? notebook;
  final ValueChanged<NotebookModel>? onNotebookTap;

  @override
  ChangeNotebookSheetState createState() => ChangeNotebookSheetState();
}

class ChangeNotebookSheetState extends BasePage<ChangeNotebookSheet> {
  NotebookModel? get _notebook => widget.notebook;
  ValueChanged<NotebookModel>? get _onNotebookTap => widget.onNotebookTap;

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
            'Move Note',
            style: typoTheme.s15w700style(),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 20),
          Text(
            'SELECT NOTEBOOK',
            style: typoTheme.s14w500style(),
          ),
          ..._buildNotebookList()
        ],
      ),
    );
  }

  List<Widget> _buildNotebookList() {
    final notebookState = ref.watch(notebooksProvider);

    return notebookState.when(
      loading: () {
        return [
          const Center(
            child: CircularProgressIndicator(),
          )
        ];
      },
      notebooksLoaded: (notebooks) {
        return notebooks
            .map(
              (notebookRecord) => ListTile(
                tileColor: notebookRecord.id == _notebook?.id
                    ? Colors.grey
                    : Colors.white,
                title: Text(notebookRecord.name),
                onTap: () {
                  _onNotebookTap?.call(notebookRecord);
                  Navigator.pop(context);
                },
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
