// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notebook_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotebookModel _$NotebookModelFromJson(Map<String, dynamic> json) {
  return _NotebookModel.fromJson(json);
}

/// @nodoc
mixin _$NotebookModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String>? get notes => throw _privateConstructorUsedError;
  List<String>? get subNotebooks => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotebookModelCopyWith<NotebookModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotebookModelCopyWith<$Res> {
  factory $NotebookModelCopyWith(
          NotebookModel value, $Res Function(NotebookModel) then) =
      _$NotebookModelCopyWithImpl<$Res, NotebookModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      List<String>? notes,
      List<String>? subNotebooks,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$NotebookModelCopyWithImpl<$Res, $Val extends NotebookModel>
    implements $NotebookModelCopyWith<$Res> {
  _$NotebookModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? notes = freezed,
    Object? subNotebooks = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      subNotebooks: freezed == subNotebooks
          ? _value.subNotebooks
          : subNotebooks // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
abstract class _$$_NotebookModelCopyWith<$Res>
    implements $NotebookModelCopyWith<$Res> {
  factory _$$_NotebookModelCopyWith(
          _$_NotebookModel value, $Res Function(_$_NotebookModel) then) =
      __$$_NotebookModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      List<String>? notes,
      List<String>? subNotebooks,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$_NotebookModelCopyWithImpl<$Res>
    extends _$NotebookModelCopyWithImpl<$Res, _$_NotebookModel>
    implements _$$_NotebookModelCopyWith<$Res> {
  __$$_NotebookModelCopyWithImpl(
      _$_NotebookModel _value, $Res Function(_$_NotebookModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? notes = freezed,
    Object? subNotebooks = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_NotebookModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      subNotebooks: freezed == subNotebooks
          ? _value._subNotebooks
          : subNotebooks // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
class _$_NotebookModel with DiagnosticableTreeMixin implements _NotebookModel {
  const _$_NotebookModel(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      final List<String>? notes,
      final List<String>? subNotebooks,
      this.createdAt,
      this.updatedAt})
      : _notes = notes,
        _subNotebooks = subNotebooks;

  factory _$_NotebookModel.fromJson(Map<String, dynamic> json) =>
      _$$_NotebookModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  final List<String>? _notes;
  @override
  List<String>? get notes {
    final value = _notes;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _subNotebooks;
  @override
  List<String>? get subNotebooks {
    final value = _subNotebooks;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotebookModel(id: $id, name: $name, notes: $notes, subNotebooks: $subNotebooks, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotebookModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('subNotebooks', subNotebooks))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotebookModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            const DeepCollectionEquality()
                .equals(other._subNotebooks, _subNotebooks) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_notes),
      const DeepCollectionEquality().hash(_subNotebooks),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotebookModelCopyWith<_$_NotebookModel> get copyWith =>
      __$$_NotebookModelCopyWithImpl<_$_NotebookModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotebookModelToJson(
      this,
    );
  }
}

abstract class _NotebookModel implements NotebookModel {
  const factory _NotebookModel(
      {@JsonKey(name: '_id') required final String id,
      required final String name,
      final List<String>? notes,
      final List<String>? subNotebooks,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$_NotebookModel;

  factory _NotebookModel.fromJson(Map<String, dynamic> json) =
      _$_NotebookModel.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  List<String>? get notes;
  @override
  List<String>? get subNotebooks;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_NotebookModelCopyWith<_$_NotebookModel> get copyWith =>
      throw _privateConstructorUsedError;
}
