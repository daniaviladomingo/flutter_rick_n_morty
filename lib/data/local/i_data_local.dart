import 'package:rick_and_morty/domain/model/character.dart';
import 'package:rick_and_morty/domain/model/character_detail.dart';

abstract class IDataLocal {
  Future<void> addCharacterToFavorite(CharacterDetail character);

  Future<void> removeCharacterFromFavorite(int idCharacter);

  Stream<List<Character>> getFavoritesCharacters();

  Future<bool> isCharacterFavorite(int idCharacter);
}
