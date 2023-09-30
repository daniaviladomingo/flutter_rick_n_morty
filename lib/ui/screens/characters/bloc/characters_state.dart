part of 'characters_bloc.dart';

@freezed
class CharactersState with _$CharactersState {
  const factory CharactersState({
    required BaseUiState<List<Character>> characters,
  }) = _CharactersState;
}
