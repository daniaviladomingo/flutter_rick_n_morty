import 'package:rick_and_morty/domain/i_repository.dart';
import 'package:rick_and_morty/domain/interactors/base/base_use_case_future.dart';
import 'package:rick_and_morty/domain/model/character.dart';

class GetCharactersUseCase extends BaseUseCaseFutureOUT<List<Character>> {
  final IRepository repository;

  GetCharactersUseCase({required this.repository});

  @override
  Future<List<Character>> block() => repository.getCharacters();
}
