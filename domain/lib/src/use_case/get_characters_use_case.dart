import '../model/character_entity.dart';
import '../repository/i_repository.dart';
import 'base/base_use_case.dart';

class GetCharactersUseCase extends BaseUseCaseOUT<List<CharacterEntity>> {
  final IRepository repository;

  GetCharactersUseCase({required this.repository});

  @override
  Future<List<CharacterEntity>> block() => repository.getCharacters();
}
