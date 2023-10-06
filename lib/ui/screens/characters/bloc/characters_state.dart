part of 'characters_bloc.dart';

@freezed
class CharactersState with _$CharactersState {
  const factory CharactersState({
    required ResourceUiState<List<CharacterEntity>> characters,
  }) = _CharactersState;
}
