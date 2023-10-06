import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:http/http.dart';
import '../data/remote/i_data_remote.dart';
import 'model/api_character.dart';
import 'model/api_characters_result.dart';

class DataRemoteImp extends IDataRemote {
  final Client httpClient;
  final Mapper<ApiCharacter, CharacterEntity> characterMapper;
  final Mapper<ApiCharacter, CharacterDetailEntity> characterDetailMapper;

  DataRemoteImp({required this.httpClient, required this.characterMapper, required this.characterDetailMapper});

  @override
  Future<List<CharacterEntity>> getCharacters() async {
    final response = await httpClient.get(Uri.parse('https://rickandmortyapi.com/api/character')).getDataOrError();
    final Map<String, dynamic> parsed = jsonDecode(response.body);
    final ApiCharactersResult result = ApiCharactersResult.fromJson(parsed);
    return characterMapper.mapList(result.results);
  }

  @override
  Future<CharacterDetailEntity> getCharacterDetail(int idCharacter) async {
    final response = await httpClient.get(Uri.parse('https://rickandmortyapi.com/api/character/$idCharacter')).getDataOrError();
    final Map<String, dynamic> parsed = jsonDecode(response.body);
    final ApiCharacter result = ApiCharacter.fromJson(parsed);
    return characterDetailMapper.map(result);
  }
}

extension ResponseExtension on Future<Response> {
  Future<Response> getDataOrError() async {
    final Response response = (await this);
    if (HttpStatus.ok == response.statusCode) {
      return response;
    } else {
      throw GenericRemoteError(response.reasonPhrase ?? "");
    }
  }
}
