import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/provider/app_start_provider.dart';
import '../../../app/state/app_start_state.dart';
import '../../../shared/http/api_exception.dart';
import '../repository/notebook_repository.dart';
import '../state/notebooks_state.dart';

final notebooksProvider =
    StateNotifierProvider<NoteBookProvider, NotebooksState>((ref) {
  final appStartState = ref.watch(appStartProvider);

  return NoteBookProvider(ref, appStartState);
});

class NoteBookProvider extends StateNotifier<NotebooksState> {
  NoteBookProvider(this._reader, this._appStartState)
      : super(const NotebooksState.loading()) {
    _init();
  }

  final Ref _reader;
  final AppStartState _appStartState;

  late final NotebookRepository _notebookRepository =
      _reader.read(notebookRepositoryProvider);

  Future<void> _init() async {
    _appStartState.maybeMap(
      authenticated: (userInfo) {
        fetchNoteBooks();
      },
      orElse: () {},
    );
  }

  Future<void> fetchNoteBooks() async {
    final response = await _notebookRepository.fetchNotebooks();

    if (mounted) {
      state = response;
    }
  }

  Future<void> creatingNewNotebook(String newNotebookName) async {
    if (newNotebookName.isEmpty) return;

    final newNotebookRecord =
        await _notebookRepository.createNewNotebook(newNotebookName);

    if (newNotebookRecord != null) {
      state.maybeWhen(
        notebooksLoaded: (notebooks) {
          final notebookRecords = notebooks.toList()..add(newNotebookRecord);
          state = NotebooksState.notebooksLoaded(notebookRecords);
        },
        orElse: () {},
      );
    } else {
      state = const NotebooksState.error(
        ApiException.errorWithMessage("Can't create notebook right now"),
      );
    }
  }

  Future<void> deletingNotebook(String notebookID) async {
    state.maybeWhen(
      notebooksLoaded: (notebooks) {
        final notebookRecords = notebooks.toList()
          ..removeWhere((notebook) => notebook.id == notebookID);
        state = NotebooksState.notebooksLoaded(notebookRecords);
      },
      orElse: () {},
    );

    await _notebookRepository.deleteNotebook(notebookID);
  }
}
