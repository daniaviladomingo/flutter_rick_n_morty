import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:rick_and_morty/common/mapper.dart';
import 'package:rick_and_morty/data/remote/i_data_remote.dart';
import 'package:rick_and_morty/data_remote/model/character.dart';
import 'package:rick_and_morty/data_remote/model/characters_result.dart';
import 'package:rick_and_morty/domain/model/character.dart';
import 'package:rick_and_morty/domain/model/character_detail.dart';

class DataRemoteImp extends IDataRemote {
  final Client httpClient;
  final Mapper<ApiCharacter, Character> characterMapper;
  final Mapper<ApiCharacter, CharacterDetail> characterDetailMapper;

  DataRemoteImp({required this.httpClient, required this.characterMapper, required this.characterDetailMapper});

  @override
  Future<List<Character>> getCharacters() async {
    final response = await httpClient
        .get(Uri.parse('https://rickandmortyapi.com/api/character'));
    final Map<String, dynamic> parsed = jsonDecode(response.body);
    final ApiCharactersResult result = ApiCharactersResult.fromJson(parsed);
    return characterMapper.mapList(result.results);
    // return compute(parse, responseBody).then((value) => characterMapper.mapList(value.results));
    // return characterMapper.mapList(result.results);
  }

  // List<Character> _parse(String responseBody) {
  //   final Map<String, dynamic> parsed = jsonDecode(responseBody);
  //   final ApiCharactersResult result = ApiCharactersResult.fromJson(parsed);
  //   return characterMapper.mapList(result.results);
  // }
  ApiCharactersResult _parse(String responseBody) {
    final Map<String, dynamic> parsed = jsonDecode(responseBody);
    final ApiCharactersResult result = ApiCharactersResult.fromJson(parsed);
    return result;
  }

  @override
  Future<CharacterDetail> getCharacterDetail(int idCharacter) async {
    final response = await httpClient.get(Uri.parse('https://rickandmortyapi.com/api/character/$idCharacter'));
    final Map<String, dynamic> parsed = jsonDecode(response.body);
    final ApiCharacter result = ApiCharacter.fromJson(parsed);
    return characterDetailMapper.map(result);
  }
}
