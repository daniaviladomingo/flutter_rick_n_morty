import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../model/resources_ui_state.dart';

part 'character_detail_event.dart';

part 'character_detail_state.dart';

part 'character_detail_bloc.freezed.dart';

class CharacterDetailBloc extends Bloc<CharacterDetailEvent, CharacterDetailState> {
  final BaseUseCaseINOUT<int, CharacterDetailEntity> getCharacterDetailUseCase;
  final BaseUseCaseINOUT<int, bool> switchCharacterFavorite;
  final BaseUseCaseINOUT<int, bool> isCharacterFavoriteUseCase;
  final int idCharacter;

  CharacterDetailBloc({
    required this.getCharacterDetailUseCase,
    required this.switchCharacterFavorite,
    required this.isCharacterFavoriteUseCase,
    required this.idCharacter,
  }) : super(const CharacterDetailState(characterDetail: ResourceUiState.idle(), isFavorite: ResourceUiState.idle())) {
    on<CharacterDetailEvent>((event, emit) async {
      await event.when(
        init: () => _fetch(emit),
        onFavoriteItemClick: () => _onFavoriteItemClick(emit),
      );
    });
  }

  Future<void> _onFavoriteItemClick(Emitter<CharacterDetailState> emit) async {
    emit(state.copyWith(isFavorite: const ResourceUiState.loading()));
    emit(
      (await switchCharacterFavorite.invoke(idCharacter)).when(
        success: (data) => state.copyWith(isFavorite: ResourceUiState.success(data: data)),
        failure: (reason) => state.copyWith(isFavorite: ResourceUiState.failure(reason: reason)),
      ),
    );
  }

  Future<void> _fetch(Emitter<CharacterDetailState> emit) async {
    emit(state.copyWith(characterDetail: const ResourceUiState.loading()));
    emit(
      (await getCharacterDetailUseCase.invoke(idCharacter)).when(
        success: (data) => state.copyWith(characterDetail: ResourceUiState.success(data: data)),
        failure: (reason) => state.copyWith(characterDetail: ResourceUiState.failure(reason: reason)),
      ),
    );
    emit(state.copyWith(isFavorite: const ResourceUiState.loading()));
    emit(
      (await isCharacterFavoriteUseCase.invoke(idCharacter)).when(
        success: (data) => state.copyWith(isFavorite: ResourceUiState.success(data: data)),
        failure: (reason) => state.copyWith(isFavorite: ResourceUiState.failure(reason: reason)),
      ),
    );
  }
}
