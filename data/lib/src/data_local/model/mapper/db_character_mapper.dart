import 'package:common/common.dart';
import 'package:domain/domain.dart';
import '../db_character.dart';

class DbCharacterMapper extends Mapper<DbCharacter, CharacterEntity> {
  @override
  DbCharacter inverseMap(CharacterEntity model) => DbCharacter()
    ..id = model.id
    ..name = model.name
    ..img = model.image;

  @override
  CharacterEntity map(DbCharacter model) => CharacterEntity(
        id: model.id,
        name: model.name,
        image: model.img,
      );
}
