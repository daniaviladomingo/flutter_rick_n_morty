// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiLocation _$ApiLocationFromJson(Map<String, dynamic> json) {
  return _ApiLocation.fromJson(json);
}

/// @nodoc
mixin _$ApiLocation {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiLocationCopyWith<ApiLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiLocationCopyWith<$Res> {
  factory $ApiLocationCopyWith(
          ApiLocation value, $Res Function(ApiLocation) then) =
      _$ApiLocationCopyWithImpl<$Res, ApiLocation>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$ApiLocationCopyWithImpl<$Res, $Val extends ApiLocation>
    implements $ApiLocationCopyWith<$Res> {
  _$ApiLocationCopyWithImpl(this._value, this._then);

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
abstract class _$$_ApiLocationCopyWith<$Res>
    implements $ApiLocationCopyWith<$Res> {
  factory _$$_ApiLocationCopyWith(
          _$_ApiLocation value, $Res Function(_$_ApiLocation) then) =
      __$$_ApiLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$_ApiLocationCopyWithImpl<$Res>
    extends _$ApiLocationCopyWithImpl<$Res, _$_ApiLocation>
    implements _$$_ApiLocationCopyWith<$Res> {
  __$$_ApiLocationCopyWithImpl(
      _$_ApiLocation _value, $Res Function(_$_ApiLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$_ApiLocation(
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
class _$_ApiLocation implements _ApiLocation {
  const _$_ApiLocation({required this.name, required this.url});

  factory _$_ApiLocation.fromJson(Map<String, dynamic> json) =>
      _$$_ApiLocationFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'ApiLocation(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiLocation &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiLocationCopyWith<_$_ApiLocation> get copyWith =>
      __$$_ApiLocationCopyWithImpl<_$_ApiLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiLocationToJson(
      this,
    );
  }
}

abstract class _ApiLocation implements ApiLocation {
  const factory _ApiLocation(
      {required final String name, required final String url}) = _$_ApiLocation;

  factory _ApiLocation.fromJson(Map<String, dynamic> json) =
      _$_ApiLocation.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_ApiLocationCopyWith<_$_ApiLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
