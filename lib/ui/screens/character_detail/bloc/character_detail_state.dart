part of 'character_detail_bloc.dart';

@freezed
class CharacterDetailState with _$CharacterDetailState {
  const factory CharacterDetailState({
    required BaseUiState<CharacterDetail> characterDetail,
    required BaseUiState<bool> isFavorite,
  }) = _CharacterDetailState;
}
