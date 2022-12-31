import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/http/api_exception.dart';
import '../../../shared/model/model.dart';

part 'tags_state.freezed.dart';

@freezed
class TagsState with _$TagsState {
  const factory TagsState.loading() = _Loading;

  const factory TagsState.tagsLoaded(List<TagModel> tags) = _Loaded;

  const factory TagsState.error(ApiException error) = _Error;
}
