import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../model/resources_ui_state.dart';

part 'characters_event.dart';

part 'characters_state.dart';

part 'characters_bloc.freezed.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final BaseUseCaseOUT<List<CharacterEntity>> getCharactersUseCase;

  CharactersBloc({
    required this.getCharactersUseCase,
  }) : super(const CharactersState(characters: ResourceUiState.idle())) {
    on<CharactersEvent>((event, emit) async {
      await event.when(
        init: () async {
          await _fetch(emit);
        },
      );
    });
  }

  Future<void> _fetch(Emitter<CharactersState> emit) async {
    emit(const CharactersState(characters: ResourceUiState.loading()));
    emit(
      (await getCharactersUseCase.invoke()).when(
        success: (data) => CharactersState(characters: ResourceUiState.success(data: data)),
        failure: (reason) => CharactersState(characters: ResourceUiState.failure(reason: reason)),
      ),
    );
  }
}
