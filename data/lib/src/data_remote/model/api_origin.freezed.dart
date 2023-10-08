// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_origin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiOrigin _$ApiOriginFromJson(Map<String, dynamic> json) {
  return _ApiOrigin.fromJson(json);
}

/// @nodoc
mixin _$ApiOrigin {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiOriginCopyWith<ApiOrigin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiOriginCopyWith<$Res> {
  factory $ApiOriginCopyWith(ApiOrigin value, $Res Function(ApiOrigin) then) =
      _$ApiOriginCopyWithImpl<$Res, ApiOrigin>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$ApiOriginCopyWithImpl<$Res, $Val extends ApiOrigin>
    implements $ApiOriginCopyWith<$Res> {
  _$ApiOriginCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiOriginCopyWith<$Res> implements $ApiOriginCopyWith<$Res> {
  factory _$$_ApiOriginCopyWith(
          _$_ApiOrigin value, $Res Function(_$_ApiOrigin) then) =
      __$$_ApiOriginCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$_ApiOriginCopyWithImpl<$Res>
    extends _$ApiOriginCopyWithImpl<$Res, _$_ApiOrigin>
    implements _$$_ApiOriginCopyWith<$Res> {
  __$$_ApiOriginCopyWithImpl(
      _$_ApiOrigin _value, $Res Function(_$_ApiOrigin) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$_ApiOrigin(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiOrigin implements _ApiOrigin {
  const _$_ApiOrigin({required this.name, required this.url});

  factory _$_ApiOrigin.fromJson(Map<String, dynamic> json) =>
      _$$_ApiOriginFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'ApiOrigin(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiOrigin &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiOriginCopyWith<_$_ApiOrigin> get copyWith =>
      __$$_ApiOriginCopyWithImpl<_$_ApiOrigin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiOriginToJson(
      this,
    );
  }
}

abstract class _ApiOrigin implements ApiOrigin {
  const factory _ApiOrigin(
      {required final String name, required final String url}) = _$_ApiOrigin;

  factory _ApiOrigin.fromJson(Map<String, dynamic> json) =
      _$_ApiOrigin.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_ApiOriginCopyWith<_$_ApiOrigin> get copyWith =>
      throw _privateConstructorUsedError;
}
