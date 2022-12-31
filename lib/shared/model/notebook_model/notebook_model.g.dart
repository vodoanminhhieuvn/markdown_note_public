// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notebook_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotebookModel _$$_NotebookModelFromJson(Map<String, dynamic> json) =>
    _$_NotebookModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      notes:
          (json['notes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      subNotebooks: (json['subNotebooks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_NotebookModelToJson(_$_NotebookModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'notes': instance.notes,
      'subNotebooks': instance.subNotebooks,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
