import 'package:domain/domain.dart';


abstract interface class ISSApi {
  Future<List<CharacterEntity>> getCharacters();

  Future<CharacterDetailEntity> getCharacterDetail(int idCharacter);

  Future<void> login(UserCredentialsEntity credentials);
}
