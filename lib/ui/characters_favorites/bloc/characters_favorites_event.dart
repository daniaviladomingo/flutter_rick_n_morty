part of 'characters_favorites_bloc.dart';

@freezed
class CharactersFavoritesEvent with _$CharactersFavoritesEvent {
  const factory CharactersFavoritesEvent.fetch() = _Fetch;
}
