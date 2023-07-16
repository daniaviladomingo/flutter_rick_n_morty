import 'package:rick_and_morty/common/mapper.dart';
import 'package:rick_and_morty/data_remote/model/character.dart';
import 'package:rick_and_morty/domain/model/character.dart';
import 'package:rick_and_morty/domain/model/character_detail.dart';

class ApiCharacterDetailMapper extends Mapper<ApiCharacter, CharacterDetail> {
  @override
  ApiCharacter inverseMap(CharacterDetail model) {
    // TODO: implement inverseMap
    throw UnimplementedError();
  }

  @override
  CharacterDetail map(ApiCharacter model) =>
      CharacterDetail(
        id: model.id,
        name: model.name,
        status: switch(model.status){
          'Alive' => Status.alive,
          'Dead' => Status.dead,
          'unknown' => Status.unknown,
          _ => throw Exception("Illegal status: ${model.status}")
        },
        species: model.species,
        gender: switch(model.gender){
          'Female' => Gender.female,
          'Male' => Gender.male,
          'Genderless' => Gender.genderless,
          'unknown' => Gender.unknown,
          _ => throw Exception("Illegal gender: ${model.gender}")
        },
        origin: model.origin.name,
        location: model.location.name,
        image: model.image,
      );
}
