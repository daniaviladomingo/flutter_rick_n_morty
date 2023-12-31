// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_detail_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CharacterDetailEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String get species => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  String get origin => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CharacterDetailEntityCopyWith<CharacterDetailEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterDetailEntityCopyWith<$Res> {
  factory $CharacterDetailEntityCopyWith(CharacterDetailEntity value,
          $Res Function(CharacterDetailEntity) then) =
      _$CharacterDetailEntityCopyWithImpl<$Res, CharacterDetailEntity>;
  @useResult
  $Res call(
      {int id,
      String name,
      Status status,
      String species,
      Gender gender,
      String origin,
      String location,
      String image});
}

/// @nodoc
class _$CharacterDetailEntityCopyWithImpl<$Res,
        $Val extends CharacterDetailEntity>
    implements $CharacterDetailEntityCopyWith<$Res> {
  _$CharacterDetailEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? species = null,
    Object? gender = null,
    Object? origin = null,
    Object? location = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CharacterDetailEntityImplCopyWith<$Res>
    implements $CharacterDetailEntityCopyWith<$Res> {
  factory _$$CharacterDetailEntityImplCopyWith(
          _$CharacterDetailEntityImpl value,
          $Res Function(_$CharacterDetailEntityImpl) then) =
      __$$CharacterDetailEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      Status status,
      String species,
      Gender gender,
      String origin,
      String location,
      String image});
}

/// @nodoc
class __$$CharacterDetailEntityImplCopyWithImpl<$Res>
    extends _$CharacterDetailEntityCopyWithImpl<$Res,
        _$CharacterDetailEntityImpl>
    implements _$$CharacterDetailEntityImplCopyWith<$Res> {
  __$$CharacterDetailEntityImplCopyWithImpl(_$CharacterDetailEntityImpl _value,
      $Res Function(_$CharacterDetailEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? species = null,
    Object? gender = null,
    Object? origin = null,
    Object? location = null,
    Object? image = null,
  }) {
    return _then(_$CharacterDetailEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CharacterDetailEntityImpl implements _CharacterDetailEntity {
  const _$CharacterDetailEntityImpl(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image});

  @override
  final int id;
  @override
  final String name;
  @override
  final Status status;
  @override
  final String species;
  @override
  final Gender gender;
  @override
  final String origin;
  @override
  final String location;
  @override
  final String image;

  @override
  String toString() {
    return 'CharacterDetailEntity(id: $id, name: $name, status: $status, species: $species, gender: $gender, origin: $origin, location: $location, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterDetailEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, status, species, gender, origin, location, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterDetailEntityImplCopyWith<_$CharacterDetailEntityImpl>
      get copyWith => __$$CharacterDetailEntityImplCopyWithImpl<
          _$CharacterDetailEntityImpl>(this, _$identity);
}

abstract class _CharacterDetailEntity implements CharacterDetailEntity {
  const factory _CharacterDetailEntity(
      {required final int id,
      required final String name,
      required final Status status,
      required final String species,
      required final Gender gender,
      required final String origin,
      required final String location,
      required final String image}) = _$CharacterDetailEntityImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  Status get status;
  @override
  String get species;
  @override
  Gender get gender;
  @override
  String get origin;
  @override
  String get location;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$CharacterDetailEntityImplCopyWith<_$CharacterDetailEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
