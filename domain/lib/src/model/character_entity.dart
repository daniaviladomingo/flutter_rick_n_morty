import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_entity.freezed.dart';

@freezed
class CharacterEntity with _$CharacterEntity {
  const factory CharacterEntity({
    required int id,
    required String name,
    required String image,
  }) = _CharacterEntity;
}
