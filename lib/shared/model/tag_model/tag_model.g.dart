// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TagModel _$$_TagModelFromJson(Map<String, dynamic> json) => _$_TagModel(
      id: json['_id'] as String?,
      name: json['name'] as String,
      color: json['color'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_TagModelToJson(_$_TagModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
