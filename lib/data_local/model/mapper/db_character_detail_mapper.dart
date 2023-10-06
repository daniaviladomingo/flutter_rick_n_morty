import 'package:common/common.dart';
import 'package:domain/domain.dart';
import '../db_character.dart';

class DbCharacterDetailMapper extends Mapper<CharacterDetailEntity, DbCharacter> {
  @override
  CharacterDetailEntity inverseMap(DbCharacter model) {
    // TODO: implement inverseMap
    throw UnimplementedError();
  }

  @override
  DbCharacter map(CharacterDetailEntity model) => DbCharacter()
    ..id = model.id
    ..name = model.name
    ..img = model.image;
}
