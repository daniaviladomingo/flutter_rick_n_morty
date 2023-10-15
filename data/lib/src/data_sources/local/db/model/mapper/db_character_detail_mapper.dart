import 'package:common/common.dart';
import 'package:domain/domain.dart';
import '../db_character.dart';

class DbCharacterDetailMapper extends Mapper<DbCharacter, CharacterDetailEntity> {
  @override
  DbCharacter inverseMap(CharacterDetailEntity model) => DbCharacter()
    ..id = model.id
    ..name = model.name
    ..img = model.image;

  @override
  CharacterDetailEntity map(DbCharacter model) {
    // TODO: implement map
    throw UnimplementedError();
  }
}
