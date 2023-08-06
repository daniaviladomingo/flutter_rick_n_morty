part of 'character_detail_bloc.dart';

@freezed
class CharacterDetailEvent with _$CharacterDetailEvent {
  const factory CharacterDetailEvent.init() = _Init;
  const factory CharacterDetailEvent.onFavoriteItemClick() = _OnFavoriteItemClick;
}
