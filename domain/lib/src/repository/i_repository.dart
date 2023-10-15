import '../../domain.dart';

abstract interface class IRepository {
  Future<void> login(UserCredentialsEntity credentials);

  Future<List<CharacterEntity>> getCharacters();

  Stream<List<CharacterEntity>> getCharactersFavorites();

  Future<CharacterDetailEntity> getCharacterDetail(int idCharacter);

  Future<void> addCharacterToFavorite(CharacterDetailEntity character);

  Future<void> removeCharacterFromFavorite(int idCharacter);

  Future<bool> isCharacterFavorite(int idCharacter);
}
