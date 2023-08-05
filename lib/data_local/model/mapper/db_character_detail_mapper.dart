import 'package:rick_and_morty/common/mapper.dart';
import 'package:rick_and_morty/data_local/model/db_character.dart';
import 'package:rick_and_morty/domain/model/character_detail.dart';

class DbCharacterDetailMapper extends Mapper<CharacterDetail, DbCharacter> {
  @override
  CharacterDetail inverseMap(DbCharacter model) {
    // TODO: implement inverseMap
    throw UnimplementedError();
  }

  @override
  DbCharacter map(CharacterDetail model) => DbCharacter()
    ..id = model.id
    ..name = model.name
    ..img = model.image;
}
