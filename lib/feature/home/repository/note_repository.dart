import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/http/api_provider.dart';
import '../../../shared/model/model.dart';
import '../state/notes_state.dart';

abstract class NoteRepositoryProtocol {
  Future<NotesState> fetchNotes();
  Future<NotesState> fetchByNotebook(String notebookID);
  Future<NotesState> fetchByStatus(String status);
  Future<NoteModel?> createNote(
    String noteName,
    String markdownNote,
    String notebookID,
  );
  Future<bool> updateNote(
    String updateNoteID,
    String noteName,
    String markdownNote,
  );
  Future<bool> updateNotebook(
    String noteID,
    String notebookID,
  );
  Future<bool> updateStatus(String noteID, String status);
  Future<bool> updateTags(String noteID, List<String> tagsID);
  Future<bool> deleteNote(String noteID);
}

final noteRepositoryProvider = Provider(NoteRepository.new);

class NoteRepository implements NoteRepositoryProtocol {
  NoteRepository(this._reader);

  late final ApiProvider _api = _reader.read(apiProvider);
  final Ref _reader;

  @override
  Future<NotesState> fetchNotes() async {
    final noteResponse = await _api.get('note/get_notes');

    return noteResponse.when(
      success: (data) {
        final _noteRecords = notesModelFromJson(data as List<dynamic>);

        return NotesState.notesLoaded(_noteRecords);
      },
      error: (error) {
        return NotesState.error(error);
      },
    );
  }

  @override
  Future<NotesState> fetchByNotebook(String notebookID) async {
    final queryParams = {'notebookID': notebookID};

    final notesResponse =
        await _api.get('notebook/get_notes', query: queryParams);

    return notesResponse.when(
      success: (data) {
        final _noteRecords = notesModelFromJson(data as List<dynamic>);

        return NotesState.notesLoaded(_noteRecords);
      },
      error: (error) {
        return NotesState.error(error);
      },
    );
  }

  @override
  Future<NotesState> fetchByStatus(String status) async {
    final queryParams = {'status': status};

    final notesResponse =
        await _api.get('note/get_notes_by_status', query: queryParams);

    return notesResponse.when(
      success: (data) {
        final _noteRecords = notesModelFromJson(data as List<dynamic>);

        return NotesState.notesLoaded(_noteRecords);
      },
      error: (error) {
        return NotesState.error(error);
      },
    );
  }

  @override
  Future<NoteModel?> createNote(
    String noteName,
    String markdownNote,
    String notebookID,
  ) async {
    final note = {
      'name': noteName,
      'markdownNote': markdownNote,
    };
    final params = {
      'note': note,
      if (notebookID.isNotEmpty) 'notebookID': notebookID
    };

    final noteResponse =
        await _api.post('note/create_note', jsonEncode(params));

    return noteResponse.when(
      success: (data) {
        final noteRecord = NoteModel.fromJson(data as Map<String, dynamic>);

        return noteRecord;
      },
      error: (error) {
        return null;
      },
    );
  }

  @override
  Future<bool> updateNote(
    String updateNoteID,
    String noteName,
    String markdownNote,
  ) async {
    final params = {
      '_id': updateNoteID,
      'name': noteName,
      'markdownNote': markdownNote
    };

    final noteResponse = await _api.put('note/update_note', jsonEncode(params));

    return noteResponse.when(
      success: (data) {
        return data as bool;
      },
      error: (error) {
        return false;
      },
    );
  }

  @override
  Future<bool> updateNotebook(String noteID, String notebookID) async {
    final params = {'noteID': noteID, 'notebookID': notebookID};

    final noteResponse =
        await _api.put('note/update_notebook', jsonEncode(params));

    return noteResponse.when(
      success: (data) {
        return data as bool;
      },
      error: (error) {
        return false;
      },
    );
  }

  @override
  Future<bool> updateStatus(String noteID, String status) async {
    final params = {
      'noteID': noteID,
      'status': status,
    };

    final noteResponse =
        await _api.put('note/update_status', jsonEncode(params));

    return noteResponse.when(
      success: (data) {
        return data as bool;
      },
      error: (error) {
        return false;
      },
    );
  }

  @override
  Future<bool> updateTags(String noteID, List<String> tagsID) async {
    if (tagsID.isEmpty) return Future.value(false);

    final params = {'noteID': noteID, 'tags': tagsID};

    final noteResponse = await _api.put('note/update_tags', jsonEncode(params));

    return noteResponse.when(
      success: (data) {
        return data as bool;
      },
      error: (error) {
        return false;
      },
    );
  }

  @override
  Future<bool> deleteNote(String noteID) async {
    final params = {'noteID': noteID};

    final noteResponse =
        await _api.post('note/delete_note', jsonEncode(params));

    return noteResponse.when(
      success: (data) {
        return data as bool;
      },
      error: (error) {
        return false;
      },
    );
  }
}
