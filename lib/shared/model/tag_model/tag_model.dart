import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_model.freezed.dart';
part 'tag_model.g.dart';

List<TagModel> tagsModelFromJson(List<dynamic> data) => List<TagModel>.from(
      data.map((e) => TagModel.fromJson(e as Map<String, dynamic>)),
    );

TagModel tagModelFromString(String str) =>
    TagModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

@freezed
class TagModel with _$TagModel {
  const factory TagModel({
    @JsonKey(name: '_id') String? id,
    required String name,
    required String color,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TagModel;

  factory TagModel.fromJson(Map<String, dynamic> json) =>
      _$TagModelFromJson(json);
}
