import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/http/api_provider.dart';
import '../../../shared/model/model.dart';
import '../state/tags_state.dart';

abstract class TagRepositoryProtocol {
  Future<TagsState> fetchTags();
  Future<TagModel?> createNewTag(String newTagName, String color);
  Future<bool> deleteTag(String tagID);
}

final tagRepositoryProvider = Provider(TagRepository.new);

class TagRepository implements TagRepositoryProtocol {
  TagRepository(this._reader);

  late final ApiProvider _api = _reader.read(apiProvider);
  final Ref _reader;

  @override
  Future<TagsState> fetchTags() async {
    final tagResponse = await _api.get('tag/get_tags');

    return tagResponse.when(
      success: (data) {
        final _tagRecords = tagsModelFromJson(data as List<dynamic>);

        return TagsState.tagsLoaded(_tagRecords);
      },
      error: (error) {
        return TagsState.error(error);
      },
    );
  }

  @override
  Future<TagModel?> createNewTag(String newTagName, String color) async {
    final params = {'name': newTagName, 'color': color};
    final tagResponse = await _api.post('tag/create_tag', jsonEncode(params));

    return tagResponse.when(
      success: (data) {
        final tagRecord = TagModel.fromJson(data as Map<String, dynamic>);

        return tagRecord;
      },
      error: (error) {
        return null;
      },
    );
  }

  @override
  Future<bool> deleteTag(String tagID) async {
    final params = {'tagID': tagID};
    final tagResponse = await _api.post('tag/delete_tag', jsonEncode(params));

    return tagResponse.when(
      success: (data) {
        return data as bool;
      },
      error: (error) {
        return false;
      },
    );
  }
}
