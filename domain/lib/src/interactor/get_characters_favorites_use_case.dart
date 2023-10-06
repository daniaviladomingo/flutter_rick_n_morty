import '../model/character_entity.dart';
import '../repository/i_repository.dart';
import 'base/base_use_case_stream.dart';

class GetCharactersFavoritesStreamUseCase extends BaseUseCaseStreamOUT<List<CharacterEntity>> {
  final IRepository repository;

  GetCharactersFavoritesStreamUseCase({required this.repository});

  @override
  Stream<List<CharacterEntity>> invoke() => repository.getCharactersFavorites();
}
