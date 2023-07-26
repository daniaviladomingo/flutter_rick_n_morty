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
  final BaseUseCaseFuture<int, bool> switchCharacterFavorite;
  final BaseUseCaseFuture<int, bool> isCharacterFavoriteUseCase;
  final int idCharacter;

  CharacterDetailBloc({
    required this.getCharacterDetailUseCase,
    required this.switchCharacterFavorite,
    required this.isCharacterFavoriteUseCase,
    required this.idCharacter
  }) : super(const CharacterDetailState(characterDetail: BaseUiState.idle(), isFavorite: BaseUiState.idle())) {
    on<CharacterDetailEvent>((event, emit) async {
      await event.when(
          fetch: () => _fetch(emit),
          onFavoriteItemClick: () => _onFavoriteItemClick(emit)
      );
    });
  }

  Future<void> _onFavoriteItemClick(Emitter<CharacterDetailState> emit) async {
    emit(state.copyWith(isFavorite: const BaseUiState.loading()));
    emit(
        (await switchCharacterFavorite.invoke(idCharacter)).when(
          success: (data) => state.copyWith(isFavorite: BaseUiState.success(data: data)),
          error: (error) => state.copyWith(isFavorite: BaseUiState.error(error: error))
        )
    );
  }

  Future<void> _fetch(Emitter<CharacterDetailState> emit) async {
    emit(state.copyWith(characterDetail: const BaseUiState.loading()));
    emit(
        (await getCharacterDetailUseCase.invoke(idCharacter)).when(
          success: (data) => state.copyWith(characterDetail: BaseUiState.success(data: data)),
          error: (error) => state.copyWith(characterDetail: BaseUiState.error(error: error))
        )
    );
    emit(state.copyWith(isFavorite: const BaseUiState.loading()));
    emit(
        (await isCharacterFavoriteUseCase.invoke(idCharacter)).when(
            success: (data) => state.copyWith(isFavorite: BaseUiState.success(data: data)),
            error: (error) => state.copyWith(isFavorite: BaseUiState.error(error: error))
        )
    );
  }
}
