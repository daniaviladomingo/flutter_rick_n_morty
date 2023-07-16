import 'package:rick_and_morty/common/mapper.dart';
import 'package:rick_and_morty/data_local/model/db_character.dart';
import 'package:rick_and_morty/domain/model/character.dart';

class DbCharacterMapper extends Mapper<DbCharacter, Character> {
  @override
  DbCharacter inverseMap(Character model) => DbCharacter()
    ..id = model.id
    ..name = model.name
    ..img = model.image;

  @override
  Character map(DbCharacter model) =>
      Character(id: model.id, name: model.name, image: model.img);
}
