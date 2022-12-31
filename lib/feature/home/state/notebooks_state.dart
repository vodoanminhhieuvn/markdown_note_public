import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/http/api_exception.dart';
import '../../../shared/model/model.dart';

part 'notebooks_state.freezed.dart';

@freezed
class NotebooksState with _$NotebooksState {
  const factory NotebooksState.loading() = _Loading;
  const factory NotebooksState.notebooksLoaded(List<NotebookModel> notebooks) =
      _Loaded;
  const factory NotebooksState.error(ApiException error) = _Error;
}
