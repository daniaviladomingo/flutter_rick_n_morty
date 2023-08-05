import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/domain/interactors/base/base_use_case_stream.dart';
import 'package:rick_and_morty/domain/model/character.dart';
import 'package:rick_and_morty/ui/base/base_ui_state.dart';

part 'characters_favorites_event.dart';

part 'characters_favorites_state.dart';

part 'characters_favorites_bloc.freezed.dart';

class CharactersFavoritesBloc extends Bloc<CharactersFavoritesEvent, CharactersFavoritesState> {
  final BaseUseCaseStreamOUT<List<Character>> getCharactersFavoritesStreamUseCase;

  CharactersFavoritesBloc({required this.getCharactersFavoritesStreamUseCase}) : super(const CharactersFavoritesState(characters: BaseUiState.idle())) {
    on<CharactersFavoritesEvent>((event, emit) async {
      await event.when(init: () async {
        await getCharactersFavoritesStreamUseCase.invoke().forEach((element) {
          if (element.isNotEmpty) {
            emit(CharactersFavoritesState(characters: BaseUiState.success(data: element)));
          } else {
            emit(const CharactersFavoritesState(characters: BaseUiState.empty()));
          }
        });
      });
    });
  }
}
