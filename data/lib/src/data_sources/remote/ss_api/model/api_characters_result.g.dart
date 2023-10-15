// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_characters_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiCharactersResultImpl _$$ApiCharactersResultImplFromJson(
        Map<String, dynamic> json) =>
    _$ApiCharactersResultImpl(
      results: (json['results'] as List<dynamic>)
          .map((e) => ApiCharacter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ApiCharactersResultImplToJson(
        _$ApiCharactersResultImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
