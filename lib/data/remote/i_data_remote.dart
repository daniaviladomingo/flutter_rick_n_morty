import 'package:rick_and_morty/domain/model/character.dart';
import 'package:rick_and_morty/domain/model/character_detail.dart';

abstract class IDataRemote {
  Future<List<Character>> getCharacters();
  Future<CharacterDetail> getCharacterDetail(int idCharacter);
}