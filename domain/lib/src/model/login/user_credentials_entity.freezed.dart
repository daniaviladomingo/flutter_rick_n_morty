// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_credentials_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserCredentialsEntity {
  String get user => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCredentialsEntityCopyWith<UserCredentialsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCredentialsEntityCopyWith<$Res> {
  factory $UserCredentialsEntityCopyWith(UserCredentialsEntity value,
          $Res Function(UserCredentialsEntity) then) =
      _$UserCredentialsEntityCopyWithImpl<$Res, UserCredentialsEntity>;
  @useResult
  $Res call({String user, String password});
}

/// @nodoc
class _$UserCredentialsEntityCopyWithImpl<$Res,
        $Val extends UserCredentialsEntity>
    implements $UserCredentialsEntityCopyWith<$Res> {
  _$UserCredentialsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserCredentialsEntityImplCopyWith<$Res>
    implements $UserCredentialsEntityCopyWith<$Res> {
  factory _$$UserCredentialsEntityImplCopyWith(
          _$UserCredentialsEntityImpl value,
          $Res Function(_$UserCredentialsEntityImpl) then) =
      __$$UserCredentialsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String user, String password});
}

/// @nodoc
class __$$UserCredentialsEntityImplCopyWithImpl<$Res>
    extends _$UserCredentialsEntityCopyWithImpl<$Res,
        _$UserCredentialsEntityImpl>
    implements _$$UserCredentialsEntityImplCopyWith<$Res> {
  __$$UserCredentialsEntityImplCopyWithImpl(_$UserCredentialsEntityImpl _value,
      $Res Function(_$UserCredentialsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? password = null,
  }) {
    return _then(_$UserCredentialsEntityImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserCredentialsEntityImpl implements _UserCredentialsEntity {
  const _$UserCredentialsEntityImpl(
      {required this.user, required this.password});

  @override
  final String user;
  @override
  final String password;

  @override
  String toString() {
    return 'UserCredentialsEntity(user: $user, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCredentialsEntityImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCredentialsEntityImplCopyWith<_$UserCredentialsEntityImpl>
      get copyWith => __$$UserCredentialsEntityImplCopyWithImpl<
          _$UserCredentialsEntityImpl>(this, _$identity);
}

abstract class _UserCredentialsEntity implements UserCredentialsEntity {
  const factory _UserCredentialsEntity(
      {required final String user,
      required final String password}) = _$UserCredentialsEntityImpl;

  @override
  String get user;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$UserCredentialsEntityImplCopyWith<_$UserCredentialsEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
