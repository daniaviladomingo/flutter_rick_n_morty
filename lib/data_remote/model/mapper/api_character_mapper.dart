import 'package:rick_and_morty/common/mapper.dart';
import 'package:rick_and_morty/data_remote/model/character.dart';
import 'package:rick_and_morty/domain/model/character.dart';

class ApiCharacterMapper extends Mapper<ApiCharacter, Character> {
  @override
  ApiCharacter inverseMap(Character model) {
    // TODO: implement inverseMap
    throw UnimplementedError();
  }

  @override
  Character map(ApiCharacter model) =>
      Character(id: model.id, name: model.name, image: model.image);
}
