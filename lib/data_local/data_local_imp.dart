import 'dart:async';
import 'package:isar/isar.dart';
import 'package:rick_and_morty/common/mapper.dart';
import 'package:rick_and_morty/data/local/i_data_local.dart';
import 'package:rick_and_morty/data_local/model/db_character.dart';
import 'package:rick_and_morty/domain/model/character.dart';
import 'package:rick_and_morty/domain/model/character_detail.dart';

class DataLocalImp extends IDataLocal {
  final Isar isar;
  final Mapper<DbCharacter, Character> characterDbMapper;
  final Mapper<CharacterDetail, DbCharacter> characterDetailDbMapper;


  DataLocalImp({required this.isar, required this.characterDbMapper, required this.characterDetailDbMapper});

  @override
  Future<void> addCharacterToFavorite(CharacterDetail character) =>
      isar.writeTxn(() async {
        await isar.dbCharacters.put(characterDetailDbMapper.map(character));
      });

  @override
  Stream<List<Character>> getFavoritesCharacters() =>
    isar
        .dbCharacters
        .where()
        .build()
        .watch(fireImmediately: true)
        .map((event) => characterDbMapper.mapList(event));

  @override
  Future<void> removeCharacterFromFavorite(int idCharacter) =>
    isar.writeTxn(() async {
      await isar.dbCharacters.delete(idCharacter);
    });

  @override
  Future<bool> isCharacterFavorite(int idCharacter) =>
     isar.dbCharacters.where().filter().idEqualTo(idCharacter).isNotEmpty();
}
