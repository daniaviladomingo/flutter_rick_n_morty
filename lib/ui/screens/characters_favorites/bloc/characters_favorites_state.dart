part of 'characters_favorites_bloc.dart';

@freezed
class CharactersFavoritesState with _$CharactersFavoritesState {
  const factory CharactersFavoritesState({
    required BaseUiState<List<Character>> characters,
  }) = _Initial;
}
