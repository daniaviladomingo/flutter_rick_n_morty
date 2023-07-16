import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';

@freezed
class Character with _$Character {
  const factory Character(
      {required int id,
      required String name,
      required String image}) = _Character;
}
