import 'package:domain/domain.dart';

abstract class IDataLocal {
  Future<void> addCharacterToFavorite(CharacterDetailEntity character);

  Future<void> removeCharacterFromFavorite(int idCharacter);

  Stream<List<CharacterEntity>> getFavoritesCharacters();

  Future<bool> isCharacterFavorite(int idCharacter);
}
