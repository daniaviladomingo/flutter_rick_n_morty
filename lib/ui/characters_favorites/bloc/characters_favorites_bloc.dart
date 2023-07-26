import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/domain/interactors/base/base_use_case_future.dart';
import 'package:rick_and_morty/domain/model/character.dart';
import 'package:rick_and_morty/ui/base/base_ui_state.dart';

part 'characters_favorites_event.dart';

part 'characters_favorites_state.dart';

part 'characters_favorites_bloc.freezed.dart';

class CharactersFavoritesBloc extends Bloc<CharactersFavoritesEvent, CharactersFavoritesState> {
  final BaseUseCaseFuture<void, List<Character>> getCharactersFavoritesUseCase;

  CharactersFavoritesBloc({required this.getCharactersFavoritesUseCase}) : super(const CharactersFavoritesState(characters: BaseUiState.idle())) {
    on<CharactersFavoritesEvent>((event, emit) async {
      await event.when(fetch: () async {
        await _fetch(emit);
      });
    });
  }

  Future<void> _fetch(Emitter<CharactersFavoritesState> emit) async {
    emit(const CharactersFavoritesState(characters: BaseUiState.loading()));
    emit((await getCharactersFavoritesUseCase.invoke("")).when(
        success: (data) {
          if (data.isNotEmpty) {
            return CharactersFavoritesState(characters: BaseUiState.success(data: data));
          } else {
            return const CharactersFavoritesState(characters: BaseUiState.empty());
          }
        },
        error: (error) => CharactersFavoritesState(characters: BaseUiState.error(error: error))));
  }
}
