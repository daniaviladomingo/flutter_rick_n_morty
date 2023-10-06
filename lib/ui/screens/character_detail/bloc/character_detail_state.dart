part of 'character_detail_bloc.dart';

@freezed
class CharacterDetailState with _$CharacterDetailState {
  const factory CharacterDetailState({
    required ResourceUiState<CharacterDetailEntity> characterDetail,
    required ResourceUiState<bool> isFavorite,
  }) = _CharacterDetailState;
}
