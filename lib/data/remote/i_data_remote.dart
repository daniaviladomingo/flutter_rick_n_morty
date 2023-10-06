import 'package:domain/domain.dart';

abstract class IDataRemote {
  Future<List<CharacterEntity>> getCharacters();

  Future<CharacterDetailEntity> getCharacterDetail(int idCharacter);
}
