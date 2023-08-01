import 'package:rick_and_morty/data/local/i_data_local.dart';
import 'package:rick_and_morty/data/remote/i_data_remote.dart';
import 'package:rick_and_morty/domain/i_repository.dart';
import 'package:rick_and_morty/domain/model/character.dart';
import 'package:rick_and_morty/domain/model/character_detail.dart';

class RepositoryImp extends IRepository {
  final IDataRemote dataRemote;
  final IDataLocal dataLocal;

  RepositoryImp({required this.dataRemote, required this.dataLocal});

  @override
  Future<List<Character>> getCharacters() => dataRemote.getCharacters();

  @override
  Future<void> addCharacterToFavorite(CharacterDetail character) => dataLocal.addCharacterToFavorite(character);

  @override
  Stream<List<Character>> getCharactersFavorites() => dataLocal.getFavoritesCharacters();

  @override
  Future<void> removeCharacterFromFavorite(int idCharacter) => dataLocal.removeCharacterFromFavorite(idCharacter);

  @override
  Future<CharacterDetail> getCharacterDetail(int idCharacter) => dataRemote.getCharacterDetail(idCharacter);

  @override
  Future<bool> isCharacterFavorite(int idCharacter) => dataLocal.isCharacterFavorite(idCharacter);
}