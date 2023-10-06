import '../model/character_entity.dart';
import '../model/character_detail_entity.dart';

abstract class IRepository {
  Future<List<CharacterEntity>> getCharacters();

  Stream<List<CharacterEntity>> getCharactersFavorites();

  Future<CharacterDetailEntity> getCharacterDetail(int idCharacter);

  Future<void> addCharacterToFavorite(CharacterDetailEntity character);

  Future<void> removeCharacterFromFavorite(int idCharacter);

  Future<bool> isCharacterFavorite(int idCharacter);
}
