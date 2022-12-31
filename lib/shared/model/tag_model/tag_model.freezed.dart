// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tag_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TagModel _$TagModelFromJson(Map<String, dynamic> json) {
  return _TagModel.fromJson(json);
}

/// @nodoc
mixin _$TagModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagModelCopyWith<TagModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagModelCopyWith<$Res> {
  factory $TagModelCopyWith(TagModel value, $Res Function(TagModel) then) =
      _$TagModelCopyWithImpl<$Res, TagModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String name,
      String color,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$TagModelCopyWithImpl<$Res, $Val extends TagModel>
    implements $TagModelCopyWith<$Res> {
  _$TagModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? color = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TagModelCopyWith<$Res> implements $TagModelCopyWith<$Res> {
  factory _$$_TagModelCopyWith(
          _$_TagModel value, $Res Function(_$_TagModel) then) =
      __$$_TagModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String name,
      String color,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$_TagModelCopyWithImpl<$Res>
    extends _$TagModelCopyWithImpl<$Res, _$_TagModel>
    implements _$$_TagModelCopyWith<$Res> {
  __$$_TagModelCopyWithImpl(
      _$_TagModel _value, $Res Function(_$_TagModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? color = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_TagModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TagModel implements _TagModel {
  const _$_TagModel(
      {@JsonKey(name: '_id') this.id,
      required this.name,
      required this.color,
      this.createdAt,
      this.updatedAt});

  factory _$_TagModel.fromJson(Map<String, dynamic> json) =>
      _$$_TagModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String name;
  @override
  final String color;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'TagModel(id: $id, name: $name, color: $color, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TagModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, color, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TagModelCopyWith<_$_TagModel> get copyWith =>
      __$$_TagModelCopyWithImpl<_$_TagModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagModelToJson(
      this,
    );
  }
}

abstract class _TagModel implements TagModel {
  const factory _TagModel(
      {@JsonKey(name: '_id') final String? id,
      required final String name,
      required final String color,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$_TagModel;

  factory _TagModel.fromJson(Map<String, dynamic> json) = _$_TagModel.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String get name;
  @override
  String get color;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_TagModelCopyWith<_$_TagModel> get copyWith =>
      throw _privateConstructorUsedError;
}
