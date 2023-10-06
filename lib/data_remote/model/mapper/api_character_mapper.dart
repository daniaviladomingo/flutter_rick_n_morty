import 'package:common/common.dart';
import 'package:domain/domain.dart';
import '../api_character.dart';

class ApiCharacterMapper extends Mapper<ApiCharacter, CharacterEntity> {
  @override
  ApiCharacter inverseMap(CharacterEntity model) {
    // TODO: implement inverseMap
    throw UnimplementedError();
  }

  @override
  CharacterEntity map(ApiCharacter model) => CharacterEntity(
        id: model.id,
        name: model.name,
        image: model.image,
      );
}
