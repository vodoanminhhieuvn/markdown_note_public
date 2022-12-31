// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoteModel _$NoteModelFromJson(Map<String, dynamic> json) {
  return _NoteModel.fromJson(json);
}

/// @nodoc
mixin _$NoteModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get markdownNote => throw _privateConstructorUsedError;
  NotebookModel? get notebook => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  List<TagModel>? get tags => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteModelCopyWith<NoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteModelCopyWith<$Res> {
  factory $NoteModelCopyWith(NoteModel value, $Res Function(NoteModel) then) =
      _$NoteModelCopyWithImpl<$Res, NoteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      String? markdownNote,
      NotebookModel? notebook,
      String? status,
      List<TagModel>? tags,
      DateTime? createdAt,
      DateTime? updatedAt});

  $NotebookModelCopyWith<$Res>? get notebook;
}

/// @nodoc
class _$NoteModelCopyWithImpl<$Res, $Val extends NoteModel>
    implements $NoteModelCopyWith<$Res> {
  _$NoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? markdownNote = freezed,
    Object? notebook = freezed,
    Object? status = freezed,
    Object? tags = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      markdownNote: freezed == markdownNote
          ? _value.markdownNote
          : markdownNote // ignore: cast_nullable_to_non_nullable
              as String?,
      notebook: freezed == notebook
          ? _value.notebook
          : notebook // ignore: cast_nullable_to_non_nullable
              as NotebookModel?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagModel>?,
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

  @override
  @pragma('vm:prefer-inline')
  $NotebookModelCopyWith<$Res>? get notebook {
    if (_value.notebook == null) {
      return null;
    }

    return $NotebookModelCopyWith<$Res>(_value.notebook!, (value) {
      return _then(_value.copyWith(notebook: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NoteModelCopyWith<$Res> implements $NoteModelCopyWith<$Res> {
  factory _$$_NoteModelCopyWith(
          _$_NoteModel value, $Res Function(_$_NoteModel) then) =
      __$$_NoteModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      String? markdownNote,
      NotebookModel? notebook,
      String? status,
      List<TagModel>? tags,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $NotebookModelCopyWith<$Res>? get notebook;
}

/// @nodoc
class __$$_NoteModelCopyWithImpl<$Res>
    extends _$NoteModelCopyWithImpl<$Res, _$_NoteModel>
    implements _$$_NoteModelCopyWith<$Res> {
  __$$_NoteModelCopyWithImpl(
      _$_NoteModel _value, $Res Function(_$_NoteModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? markdownNote = freezed,
    Object? notebook = freezed,
    Object? status = freezed,
    Object? tags = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_NoteModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      markdownNote: freezed == markdownNote
          ? _value.markdownNote
          : markdownNote // ignore: cast_nullable_to_non_nullable
              as String?,
      notebook: freezed == notebook
          ? _value.notebook
          : notebook // ignore: cast_nullable_to_non_nullable
              as NotebookModel?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagModel>?,
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
class _$_NoteModel implements _NoteModel {
  const _$_NoteModel(
      {@JsonKey(name: '_id') this.id,
      this.name,
      this.markdownNote,
      this.notebook,
      this.status,
      final List<TagModel>? tags,
      this.createdAt,
      this.updatedAt})
      : _tags = tags;

  factory _$_NoteModel.fromJson(Map<String, dynamic> json) =>
      _$$_NoteModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;
  @override
  final String? markdownNote;
  @override
  final NotebookModel? notebook;
  @override
  final String? status;
  final List<TagModel>? _tags;
  @override
  List<TagModel>? get tags {
    final value = _tags;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'NoteModel(id: $id, name: $name, markdownNote: $markdownNote, notebook: $notebook, status: $status, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.markdownNote, markdownNote) ||
                other.markdownNote == markdownNote) &&
            (identical(other.notebook, notebook) ||
                other.notebook == notebook) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, markdownNote, notebook,
      status, const DeepCollectionEquality().hash(_tags), createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoteModelCopyWith<_$_NoteModel> get copyWith =>
      __$$_NoteModelCopyWithImpl<_$_NoteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NoteModelToJson(
      this,
    );
  }
}

abstract class _NoteModel implements NoteModel {
  const factory _NoteModel(
      {@JsonKey(name: '_id') final String? id,
      final String? name,
      final String? markdownNote,
      final NotebookModel? notebook,
      final String? status,
      final List<TagModel>? tags,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$_NoteModel;

  factory _NoteModel.fromJson(Map<String, dynamic> json) =
      _$_NoteModel.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get name;
  @override
  String? get markdownNote;
  @override
  NotebookModel? get notebook;
  @override
  String? get status;
  @override
  List<TagModel>? get tags;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_NoteModelCopyWith<_$_NoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}
