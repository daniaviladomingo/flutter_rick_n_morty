import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:rick_and_morty/data_remote/model/api_location.dart';
import 'package:rick_and_morty/data_remote/model/api_origin.dart';

part 'api_character.freezed.dart';

part 'api_character.g.dart';

@freezed
class ApiCharacter with _$ApiCharacter {
  const factory ApiCharacter({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required ApiOrigin origin,
    required ApiLocation location,
    required String image,
    required List<String> episode,
    required String url,
    required String created,
  }) = _Character;

  factory ApiCharacter.fromJson(Map<String, dynamic> json) => _$ApiCharacterFromJson(json);
}
