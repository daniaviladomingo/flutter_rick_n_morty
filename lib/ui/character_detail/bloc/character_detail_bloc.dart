import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/domain/interactors/base/base_use_case_future.dart';
import 'package:rick_and_morty/domain/model/character_detail.dart';
import 'package:rick_and_morty/ui/base/base_ui_state.dart';

part 'character_detail_event.dart';

part 'character_detail_state.dart';

part 'character_detail_bloc.freezed.dart';

class CharacterDetailBloc extends Bloc<CharacterDetailEvent, CharacterDetailState> {
  final BaseUseCaseFuture<int, CharacterDetail> getCharacterDetailUseCase;
  final BaseUseCaseFuture<CharacterDetail, void> addCharacterToFavoriteUseCase;
  final BaseUseCaseFuture<int, void> removeCharacterFromFavoriteUseCase;
  final BaseUseCaseFuture<int, bool> isCharacterFavoriteUseCase;

  CharacterDetailBloc({
    required this.getCharacterDetailUseCase,
    required this.addCharacterToFavoriteUseCase,
    required this.removeCharacterFromFavoriteUseCase,
    required this.isCharacterFavoriteUseCase
  }) : super(const CharacterDetailState(characterDetail: BaseUiState.idle(), isFavorite: BaseUiState.idle())) {
    on<CharacterDetailEvent>((event, emit) async {
      await event.when(
          fetch: (idCharacter) => _fetch(emit, idCharacter),
          onFavoriteItemClick: () => _onFavoriteItemClick(emit)
      );
    });
  }

  Future<void> _onFavoriteItemClick(Emitter<CharacterDetailState> emit) async {
    await state.isFavorite.handleSuccess((isFavorite) async {
      await state.characterDetail.handleSuccess((character) async {
        await (isFavorite ? _removeFromFavorite(emit, character.id) : _addToFavorite(emit, character));
      });
    });
  }

  Future<void> _fetch(Emitter<CharacterDetailState> emit, int idCharacter) async {
    emit(state.copyWith(
        characterDetail: const BaseUiState.loading(),
        isFavorite: const BaseUiState.loading())
    );
    emit(
        (await getCharacterDetailUseCase.invoke(idCharacter)).when(
          success: (data) => state.copyWith(characterDetail: BaseUiState.success(data: data)),
          error: (error) => state.copyWith(characterDetail: BaseUiState.error(error: error))
        )
    );
    emit(
        (await isCharacterFavoriteUseCase.invoke(idCharacter)).when(
            success: (data) => state.copyWith(isFavorite: BaseUiState.success(data: data)),
            error: (error) => state.copyWith(isFavorite: BaseUiState.error(error: error))
        )
    );
  }

  Future<void> _addToFavorite(Emitter<CharacterDetailState> emit, CharacterDetail character) async {
    emit(
        (await addCharacterToFavoriteUseCase.invoke(character)).when(
          success: (_) => state.copyWith(isFavorite: const BaseUiState.success(data: true)),
          error: (error) => state.copyWith(isFavorite: BaseUiState.error(error: error))
        )
    );
  }

  Future<void> _removeFromFavorite(Emitter<CharacterDetailState> emit, int idCharacter) async {
    emit(
        (await removeCharacterFromFavoriteUseCase.invoke(idCharacter)).when(
          success: (_) => state.copyWith(isFavorite: const BaseUiState.success(data: false)),
          error: (error) => state.copyWith(isFavorite: BaseUiState.error(error: error))
        )
    );
  }
}
