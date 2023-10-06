part of 'characters_favorites_bloc.dart';

@freezed
class CharactersFavoritesState with _$CharactersFavoritesState {
  const factory CharactersFavoritesState({
    required ResourceUiState<List<CharacterEntity>> characters,
  }) = _Initial;
}
