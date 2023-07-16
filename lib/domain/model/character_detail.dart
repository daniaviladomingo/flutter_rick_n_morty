import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_detail.freezed.dart';

@freezed
class CharacterDetail with _$CharacterDetail {
  const factory CharacterDetail({required int id,
    required String name,
    required Status status,
    required String species,
    required Gender gender,
    required String origin,
    required String location,
    required String image,
  }) = _CharacterDetail;
}

enum Status {
  alive, dead, unknown
}

enum Gender {
  female, male, genderless, unknown
}