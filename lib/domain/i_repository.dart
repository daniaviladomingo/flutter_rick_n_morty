import 'package:rick_and_morty/domain/model/character.dart';
import 'package:rick_and_morty/domain/model/character_detail.dart';

abstract class IRepository{
  Future<List<Character>> getCharacters();
  Future<List<Character>> getCharactersFavorites();
  Future<CharacterDetail> getCharacterDetail(int idCharacter);
  Future<void> addCharacterToFavorite(CharacterDetail character);
  Future<void> removeCharacterFromFavorite(int idCharacter);
  Future<bool> isCharacterFavorite(int idCharacter);
}