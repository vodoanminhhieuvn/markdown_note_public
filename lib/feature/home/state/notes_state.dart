import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/http/api_exception.dart';
import '../../../shared/model/model.dart';

part 'notes_state.freezed.dart';

@freezed
class NotesState with _$NotesState {
  const factory NotesState.loading() = _Loading;

  const factory NotesState.notesLoaded(List<NoteModel> notes) = _Loaded;

  const factory NotesState.error(ApiException error) = _Error;
}
