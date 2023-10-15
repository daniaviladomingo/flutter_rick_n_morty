// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_characters_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiCharactersResult _$ApiCharactersResultFromJson(Map<String, dynamic> json) {
  return _ApiCharactersResult.fromJson(json);
}

/// @nodoc
mixin _$ApiCharactersResult {
  List<ApiCharacter> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiCharactersResultCopyWith<ApiCharactersResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiCharactersResultCopyWith<$Res> {
  factory $ApiCharactersResultCopyWith(
          ApiCharactersResult value, $Res Function(ApiCharactersResult) then) =
      _$ApiCharactersResultCopyWithImpl<$Res, ApiCharactersResult>;
  @useResult
  $Res call({List<ApiCharacter> results});
}

/// @nodoc
class _$ApiCharactersResultCopyWithImpl<$Res, $Val extends ApiCharactersResult>
    implements $ApiCharactersResultCopyWith<$Res> {
  _$ApiCharactersResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ApiCharacter>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiCharactersResultImplCopyWith<$Res>
    implements $ApiCharactersResultCopyWith<$Res> {
  factory _$$ApiCharactersResultImplCopyWith(_$ApiCharactersResultImpl value,
          $Res Function(_$ApiCharactersResultImpl) then) =
      __$$ApiCharactersResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ApiCharacter> results});
}

/// @nodoc
class __$$ApiCharactersResultImplCopyWithImpl<$Res>
    extends _$ApiCharactersResultCopyWithImpl<$Res, _$ApiCharactersResultImpl>
    implements _$$ApiCharactersResultImplCopyWith<$Res> {
  __$$ApiCharactersResultImplCopyWithImpl(_$ApiCharactersResultImpl _value,
      $Res Function(_$ApiCharactersResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$ApiCharactersResultImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ApiCharacter>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiCharactersResultImpl implements _ApiCharactersResult {
  const _$ApiCharactersResultImpl({required final List<ApiCharacter> results})
      : _results = results;

  factory _$ApiCharactersResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiCharactersResultImplFromJson(json);

  final List<ApiCharacter> _results;
  @override
  List<ApiCharacter> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'ApiCharactersResult(results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiCharactersResultImpl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiCharactersResultImplCopyWith<_$ApiCharactersResultImpl> get copyWith =>
      __$$ApiCharactersResultImplCopyWithImpl<_$ApiCharactersResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiCharactersResultImplToJson(
      this,
    );
  }
}

abstract class _ApiCharactersResult implements ApiCharactersResult {
  const factory _ApiCharactersResult(
      {required final List<ApiCharacter> results}) = _$ApiCharactersResultImpl;

  factory _ApiCharactersResult.fromJson(Map<String, dynamic> json) =
      _$ApiCharactersResultImpl.fromJson;

  @override
  List<ApiCharacter> get results;
  @override
  @JsonKey(ignore: true)
  _$$ApiCharactersResultImplCopyWith<_$ApiCharactersResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
