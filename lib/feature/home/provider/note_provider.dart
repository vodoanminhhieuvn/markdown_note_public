import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/provider/app_start_provider.dart';
import '../../../app/state/app_start_state.dart';
import '../../../shared/http/api_exception.dart';
import '../../../shared/model/model.dart';
import '../repository/note_repository.dart';
import '../state/notes_state.dart';

final notesProvider = StateNotifierProvider<NotesProvider, NotesState>((ref) {
  final appStartState = ref.watch(appStartProvider);

  return NotesProvider(ref, appStartState);
});

class NotesProvider extends StateNotifier<NotesState> {
  NotesProvider(this._reader, this._appStartState)
      : super(const NotesState.loading()) {
    _init();
  }

  final Ref _reader;
  final AppStartState _appStartState;

  late final NoteRepository _noteRepository =
      _reader.read(noteRepositoryProvider);

  Future<void> _init() async {
    _appStartState.maybeWhen(
      authenticated: (userInfo) {
        fetchNotes();
      },
      orElse: () {},
    );
  }

  Future<void> fetchNotes() async {
    final response = await _noteRepository.fetchNotes();

    if (mounted) {
      state = response;
    }
  }

  Future<void> fetchByNotebook(String notebookID) async {
    final response = await _noteRepository.fetchByNotebook(notebookID);

    if (mounted) {
      state = response;
    }
  }

  Future<void> fetchByStatus(String status) async {
    final response = await _noteRepository.fetchByStatus(status);

    if (mounted) {
      state = response;
    }
  }

  Future<void> createNote({
    required String noteName,
    required String markdownNote,
    required String notebookID,
  }) async {
    final noteRecord =
        await _noteRepository.createNote(noteName, markdownNote, notebookID);

    if (noteRecord != null) {
      state.maybeWhen(
        notesLoaded: (notes) {
          final newNoteRecords = notes.toList()..insert(0, noteRecord);

          state = NotesState.notesLoaded(newNoteRecords);
        },
        orElse: () {},
      );
    } else {
      state = const NotesState.error(
        ApiException.errorWithMessage(
          "Can't create note right now",
        ),
      );
    }
  }

  Future<void> updateNote(
    String updateNoteID,
    String noteName,
    String markdownNote,
  ) async {
    await state.maybeWhen(
      notesLoaded: (notes) async {
        final noteRecords = notes.toList();
        final updateIndex =
            noteRecords.indexWhere((element) => element.id == updateNoteID);
        noteRecords[updateIndex] = noteRecords[updateIndex]
            .copyWith(name: noteName, markdownNote: markdownNote);

        state = NotesState.notesLoaded(noteRecords);

        await _noteRepository.updateNote(
          updateNoteID,
          noteName,
          markdownNote,
        );
      },
      orElse: () {},
    );
  }

  Future<void> updateNotebook(
    NoteModel updateNote,
    String? currentViewNotebookID,
  ) async {
    final updateNotebookID = updateNote.notebook?.id;
    await state.maybeWhen(
      notesLoaded: (notes) async {
        final noteRecords = notes.toList();
        final updateIndex =
            noteRecords.indexWhere((note) => note.id == updateNote.id);

        if (updateNotebookID != null &&
            updateNotebookID == currentViewNotebookID) {
          if (updateIndex == -1) {
            noteRecords.insert(0, updateNote);
          }
        } else {
          if (updateIndex != -1 &&
              currentViewNotebookID != null &&
              currentViewNotebookID.isNotEmpty) {
            noteRecords.removeAt(updateIndex);
          }
        }

        state = NotesState.notesLoaded(noteRecords);

        if (updateNotebookID != null) {
          await _noteRepository.updateNotebook(
            updateNote.id!,
            updateNotebookID,
          );
        }
      },
      orElse: () {},
    );
  }

  Future<void> updateStatus(NoteModel updateNote) async {
    await state.maybeWhen(
      notesLoaded: (notes) async {
        final noteRecords = notes.toList();
        final updateIndex =
            noteRecords.indexWhere((note) => note.id == updateNote.id);

        if (updateIndex != -1) {
          noteRecords[updateIndex] =
              noteRecords[updateIndex].copyWith(status: updateNote.status);
          state = NotesState.notesLoaded(noteRecords);
        }

        await _noteRepository.updateStatus(updateNote.id!, updateNote.status!);
      },
      orElse: () {},
    );
  }

  Future<void> updateTags(NoteModel updateNote) async {
    if (updateNote.tags != null) {
      await state.maybeWhen(
        notesLoaded: (notes) async {
          final noteRecords = notes.toList();
          final updateIndex =
              noteRecords.indexWhere((note) => note.id == updateNote.id);

          if (updateIndex != -1) {
            noteRecords[updateIndex] =
                noteRecords[updateIndex].copyWith(tags: updateNote.tags);
            state = NotesState.notesLoaded(noteRecords);
          }

          await _noteRepository.updateTags(
            updateNote.id!,
            updateNote.tags!.map((tag) => tag.id!).toList(),
          );
        },
        orElse: () {},
      );
    }
  }

  Future<void> deleteNote(String? noteID) async {
    if (noteID != null) {
      await state.maybeWhen(
        notesLoaded: (notes) async {
          final noteRecords = notes.toList()
            ..removeWhere((note) => note.id == noteID);

          state = NotesState.notesLoaded(noteRecords);

          await _noteRepository.deleteNote(noteID);
        },
        orElse: () {},
      );
    }
  }
}
