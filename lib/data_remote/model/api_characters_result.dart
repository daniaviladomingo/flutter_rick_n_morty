import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/data_remote/model/api_character.dart';

part 'api_characters_result.freezed.dart';
part 'api_characters_result.g.dart';

@freezed
class ApiCharactersResult with _$ApiCharactersResult {
  const factory ApiCharactersResult({required List<ApiCharacter> results}) = _ApiCharactersResult;
  factory ApiCharactersResult.fromJson(Map<String, dynamic> json) => _$ApiCharactersResultFromJson(json);
}