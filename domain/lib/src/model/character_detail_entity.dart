import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_detail_entity.freezed.dart';

@freezed
class CharacterDetailEntity with _$CharacterDetailEntity {
  const factory CharacterDetailEntity({
    required int id,
    required String name,
    required Status status,
    required String species,
    required Gender gender,
    required String origin,
    required String location,
    required String image,
  }) = _CharacterDetailEntity;
}

enum Status {
  alive,
  dead,
  unknown,
}

enum Gender {
  female,
  male,
  genderless,
  unknown,
}
