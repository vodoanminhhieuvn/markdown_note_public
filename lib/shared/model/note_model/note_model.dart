import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../model.dart';

part 'note_model.freezed.dart';
part 'note_model.g.dart';

List<NoteModel> notesModelFromJson(List<dynamic> data) => List<NoteModel>.from(
      data.map((x) => NoteModel.fromJson(x as Map<String, dynamic>)),
    );

NoteModel noteModelToJson(String str) =>
    NoteModel.fromJson(json.decode(str) as Map<String, dynamic>);

@freezed
class NoteModel with _$NoteModel {
  const factory NoteModel({
    @JsonKey(name: '_id') String? id,
    String? name,
    String? markdownNote,
    NotebookModel? notebook,
    String? status,
    List<TagModel>? tags,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _NoteModel;

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);
}
