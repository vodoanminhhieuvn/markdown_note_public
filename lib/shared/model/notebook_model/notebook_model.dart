import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notebook_model.freezed.dart';
part 'notebook_model.g.dart';

List<NotebookModel> noteBooksModelFromJson(List<dynamic> data) =>
    List<NotebookModel>.from(
      data.map((e) => NotebookModel.fromJson(e as Map<String, dynamic>)),
    );

NotebookModel notebookModelFromString(String str) =>
    NotebookModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

@freezed
class NotebookModel with _$NotebookModel {
  const factory NotebookModel({
    @JsonKey(name: '_id') required String id,
    required String name,
    List<String>? notes,
    List<String>? subNotebooks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _NotebookModel;

  factory NotebookModel.fromJson(Map<String, dynamic> json) =>
      _$NotebookModelFromJson(json);
}
