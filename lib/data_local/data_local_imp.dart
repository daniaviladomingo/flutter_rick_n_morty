import 'dart:async';
import 'package:flutter/cupertino.dart';
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
  Future<List<Character>> getFavoritesCharacters() async {
    final characters = await isar.dbCharacters.where().findAll();
    final charactersMaps = characters.map((e) => characterDbMapper.map(e));
    for (var element in charactersMaps) {
      debugPrint(element.toString());
    }
    // Completer<Iterable<Character>>().complete(charactersMaps);

    return Future<List<Character>>.value(charactersMaps.toList());
  }

  @override
  Future<void> removeCharacterFromFavorite(int idCharacter) =>
    isar.writeTxn(() async {
      await isar.dbCharacters.delete(idCharacter);
    });

  @override
  Future<bool> isCharacterFavorite(int idCharacter) =>
     isar.dbCharacters.where().filter().idEqualTo(idCharacter).isNotEmpty();
}
