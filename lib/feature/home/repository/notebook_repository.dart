import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/http/api_exception.dart';
import '../../../shared/http/api_provider.dart';
import '../../../shared/model/model.dart';
import '../state/notebooks_state.dart';

abstract class NotebookRepositoryProtocol {
  Future<NotebooksState> fetchNotebooks();
  Future<NotebookModel?> createNewNotebook(String newNotebookName);
  Future<bool> deleteNotebook(String notebookID);
}

final notebookRepositoryProvider = Provider(NotebookRepository.new);

class NotebookRepository implements NotebookRepositoryProtocol {
  NotebookRepository(this._reader);

  late final ApiProvider _api = _reader.read(apiProvider);
  final Ref _reader;

  @override
  Future<NotebooksState> fetchNotebooks() async {
    final notebooksResponse = await _api.get('notebook/get_notebook');

    return notebooksResponse.when(
      success: (data) {
        try {
          final _notebooks = noteBooksModelFromJson(data as List<dynamic>);

          return NotebooksState.notebooksLoaded(_notebooks);
        } catch (error) {
          return NotebooksState.error(
            ApiException.errorWithMessage(error.toString()),
          );
        }
      },
      error: NotebooksState.error,
    );
  }

  @override
  Future<NotebookModel?> createNewNotebook(String newNotebookName) async {
    final params = {'name': newNotebookName};
    final notebookResponse =
        await _api.post('notebook/create_notebook', jsonEncode(params));

    return notebookResponse.when(
      success: (data) {
        final notebookRecord =
            NotebookModel.fromJson(data as Map<String, dynamic>);

        return notebookRecord;
      },
      error: (error) {
        return null;
      },
    );
  }

  @override
  Future<bool> deleteNotebook(String notebookID) async {
    final params = {'notebookID': notebookID};
    final response =
        await _api.post('notebook/delete_notebook', jsonEncode(params));

    return response.when(
      success: (data) {
        return data as bool;
      },
      error: (error) {
        return false;
      },
    );
  }
}
