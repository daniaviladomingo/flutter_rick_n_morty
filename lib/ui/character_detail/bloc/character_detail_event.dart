part of 'character_detail_bloc.dart';

@freezed
class CharacterDetailEvent with _$CharacterDetailEvent {
  const factory CharacterDetailEvent.fetch({required int idCharacter}) = _Fetch;
  const factory CharacterDetailEvent.onFavoriteItemClick() = _OnFavoriteItemClick;

}
