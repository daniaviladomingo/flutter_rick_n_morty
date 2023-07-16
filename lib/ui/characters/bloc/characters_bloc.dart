import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/domain/interactors/base/base_use_case_future.dart';
import 'package:rick_and_morty/domain/model/character.dart';
import 'package:rick_and_morty/ui/base/base_ui_state.dart';

part 'characters_event.dart';

part 'characters_state.dart';

part 'characters_bloc.freezed.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final BaseUseCaseFuture<void, List<Character>> getCharactersUseCase;

  CharactersBloc({required this.getCharactersUseCase}) : super(const CharactersState(characters: BaseUiState.idle())) {
    on<CharactersEvent>((event, emit) async {
      await event.when(fetch: () async {
        await _fetch(emit);
      });
    });
  }

  Future<void> _fetch(Emitter<CharactersState> emit) async {
    emit(const CharactersState(characters: BaseUiState.loading()));
    emit(
        (await getCharactersUseCase.invoke("")).when(
          success: (data) => CharactersState(characters: BaseUiState.success(data: data)),
          error: (error) => CharactersState(characters: BaseUiState.error(error: error))
        )
    );
  }
}
