// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_characters_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiCharactersResult _$$_ApiCharactersResultFromJson(
        Map<String, dynamic> json) =>
    _$_ApiCharactersResult(
      results: (json['results'] as List<dynamic>)
          .map((e) => ApiCharacter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ApiCharactersResultToJson(
        _$_ApiCharactersResult instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
