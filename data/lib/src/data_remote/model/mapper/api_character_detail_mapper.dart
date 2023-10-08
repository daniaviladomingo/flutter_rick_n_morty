import 'package:common/common.dart';
import 'package:domain/domain.dart';

import '../api_character.dart';

class ApiCharacterDetailMapper extends Mapper<ApiCharacter, CharacterDetailEntity> {
  @override
  ApiCharacter inverseMap(CharacterDetailEntity model) {
    // TODO: implement inverseMap
    throw UnimplementedError();
  }

  @override
  CharacterDetailEntity map(ApiCharacter model) => CharacterDetailEntity(
        id: model.id,
        name: model.name,
        status: switch (model.status) {
          'Alive' => Status.alive,
          'Dead' => Status.dead,
          'unknown' => Status.unknown,
          _ => throw Exception(
              "Illegal status: ${model.status}",
            ),
        },
        species: model.species,
        gender: switch (model.gender) {
          'Female' => Gender.female,
          'Male' => Gender.male,
          'Genderless' => Gender.genderless,
          'unknown' => Gender.unknown,
          _ => throw Exception(
              "Illegal gender: ${model.gender}",
            ),
        },
        origin: model.origin.name,
        location: model.location.name,
        image: model.image,
      );
}
