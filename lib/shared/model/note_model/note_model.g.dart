// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NoteModel _$$_NoteModelFromJson(Map<String, dynamic> json) => _$_NoteModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      markdownNote: json['markdownNote'] as String?,
      notebook: json['notebook'] == null
          ? null
          : NotebookModel.fromJson(json['notebook'] as Map<String, dynamic>),
      status: json['status'] as String?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => TagModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_NoteModelToJson(_$_NoteModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'markdownNote': instance.markdownNote,
      'notebook': instance.notebook,
      'status': instance.status,
      'tags': instance.tags,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
