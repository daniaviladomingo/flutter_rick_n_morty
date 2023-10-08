import 'package:domain/domain.dart';
import 'i_data_local.dart';
import 'i_data_remote.dart';

class RepositoryImp extends IRepository {
  final IDataRemote dataRemote;
  final IDataLocal dataLocal;

  RepositoryImp({required this.dataRemote, required this.dataLocal});

  @override
  Future<List<CharacterEntity>> getCharacters() => dataRemote.getCharacters();

  @override
  Future<void> addCharacterToFavorite(CharacterDetailEntity character) => dataLocal.addCharacterToFavorite(character);

  @override
  Stream<List<CharacterEntity>> getCharactersFavorites() => dataLocal.getFavoritesCharacters();

  @override
  Future<void> removeCharacterFromFavorite(int idCharacter) => dataLocal.removeCharacterFromFavorite(idCharacter);

  @override
  Future<CharacterDetailEntity> getCharacterDetail(int idCharacter) => dataRemote.getCharacterDetail(idCharacter);

  @override
  Future<bool> isCharacterFavorite(int idCharacter) => dataLocal.isCharacterFavorite(idCharacter);
}