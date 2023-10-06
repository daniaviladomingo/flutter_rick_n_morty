import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../model/resources_ui_state.dart';

part 'characters_favorites_event.dart';

part 'characters_favorites_state.dart';

part 'characters_favorites_bloc.freezed.dart';

class CharactersFavoritesBloc extends Bloc<CharactersFavoritesEvent, CharactersFavoritesState> {
  final BaseUseCaseStreamOUT<List<CharacterEntity>> getCharactersFavoritesStreamUseCase;

  CharactersFavoritesBloc({
    required this.getCharactersFavoritesStreamUseCase,
  }) : super(const CharactersFavoritesState(characters: ResourceUiState.idle())) {
    on<CharactersFavoritesEvent>((event, emit) async {
      await event.when(
        init: () async {
          await emit.onEach(
            getCharactersFavoritesStreamUseCase.invoke(),
            onData: (charactersFavorites) {
              if (charactersFavorites.isNotEmpty) {
                emit(CharactersFavoritesState(characters: ResourceUiState.success(data: charactersFavorites)));
              } else {
                emit(const CharactersFavoritesState(characters: ResourceUiState.empty()));
              }
            },
          );
        },
      );
    });
  }
}
