import 'dart:async';
import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:isar/isar.dart';
import '../i_db.dart';
import 'model/db_character.dart';

class DataLocalImp implements IDB {
  final Isar isar;
  final Mapper<DbCharacter, CharacterEntity> characterDbMapper;
  final Mapper<DbCharacter, CharacterDetailEntity> characterDetailDbMapper;

  DataLocalImp({required this.isar, required this.characterDbMapper, required this.characterDetailDbMapper});

  @override
  Future<void> addCharacterToFavorite(CharacterDetailEntity character) => isar.writeTxn(
        () async {
          await isar.dbCharacters.put(characterDetailDbMapper.inverseMap(character));
        },
      );

  @override
  Stream<List<CharacterEntity>> getFavoritesCharacters() => isar.dbCharacters.where().build().watch(fireImmediately: true).map((event) => characterDbMapper.mapList(event));

  @override
  Future<void> removeCharacterFromFavorite(int idCharacter) => isar.writeTxn(
        () async {
          await isar.dbCharacters.delete(idCharacter);
        },
      );

  @override
  Future<bool> isCharacterFavorite(int idCharacter) => isar.dbCharacters.where().filter().idEqualTo(idCharacter).isNotEmpty();
}
