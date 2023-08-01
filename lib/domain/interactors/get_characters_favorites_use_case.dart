import 'package:rick_and_morty/domain/i_repository.dart';
import 'package:rick_and_morty/domain/interactors/base/base_use_case_stream.dart';
import 'package:rick_and_morty/domain/model/character.dart';

class GetCharactersFavoritesStreamUseCase extends BaseUseCaseStream<void, List<Character>> {
  final IRepository repository;

  GetCharactersFavoritesStreamUseCase({required this.repository});

  @override
  Stream<List<Character>> block(void param) => repository.getCharactersFavorites();
}
