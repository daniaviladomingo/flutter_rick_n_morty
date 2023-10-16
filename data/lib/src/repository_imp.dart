import 'package:domain/domain.dart';
import 'data_sources/local/i_db.dart';
import 'data_sources/remote/i_ss_api.dart';

class RepositoryImp implements IRepository {
  final ISSApi sSApi;
  final IDB db;

  RepositoryImp({
    required this.sSApi,
    required this.db,
  });

  @override
  Future<void> login(UserCredentialsEntity credentials) => sSApi.login(credentials);

  @override
  Future<List<CharacterEntity>> getCharacters() => sSApi.getCharacters();

  @override
  Future<void> addCharacterToFavorite(CharacterDetailEntity character) => db.addCharacterToFavorite(character);

  @override
  Stream<List<CharacterEntity>> getCharactersFavorites() => db.getFavoritesCharacters();

  @override
  Future<void> removeCharacterFromFavorite(int idCharacter) => db.removeCharacterFromFavorite(idCharacter);

  @override
  Future<CharacterDetailEntity> getCharacterDetail(int idCharacter) => sSApi.getCharacterDetail(idCharacter);

  @override
  Future<bool> isCharacterFavorite(int idCharacter) => db.isCharacterFavorite(idCharacter);
}
