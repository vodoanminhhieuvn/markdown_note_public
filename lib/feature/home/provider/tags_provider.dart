import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/provider/app_start_provider.dart';
import '../../../app/state/app_start_state.dart';
import '../../../shared/http/api_exception.dart';
import '../repository/tag_repository.dart';
import '../state/tags_state.dart';

final tagsProvider = StateNotifierProvider<TagsProvider, TagsState>((ref) {
  final appStartState = ref.watch(appStartProvider);

  return TagsProvider(ref, appStartState);
});

class TagsProvider extends StateNotifier<TagsState> {
  TagsProvider(this._reader, this._appStartState)
      : super(const TagsState.loading()) {
    _init();
  }

  final Ref _reader;
  final AppStartState _appStartState;

  late final TagRepository _tagRepository = _reader.read(tagRepositoryProvider);

  Future<void> _init() async {
    _appStartState.maybeWhen(
      authenticated: (userInfo) {
        fetchTags();
      },
      orElse: () {},
    );
  }

  Future<void> fetchTags() async {
    final response = await _tagRepository.fetchTags();

    if (mounted) {
      state = response;
    }
  }

  Future<void> createNewTag(String newTagName, String color) async {
    final newTagRecord = await _tagRepository.createNewTag(newTagName, color);

    if (newTagRecord != null) {
      state.maybeWhen(
        tagsLoaded: (tags) {
          final newTagRecords = tags.toList()..add(newTagRecord);

          state = TagsState.tagsLoaded(newTagRecords);
        },
        orElse: () {},
      );
    } else {
      state = const TagsState.error(
        ApiException.errorWithMessage("Can't create new tag right now"),
      );
    }
  }

  Future<void> deletingTag(String tagID) async {
    state.maybeWhen(
      tagsLoaded: (tags) {
        final tagRecords = tags.toList()..removeWhere((tag) => tag.id == tagID);
        state = TagsState.tagsLoaded(tagRecords);
      },
      orElse: () {},
    );

    await _tagRepository.deleteTag(tagID);
  }
}
