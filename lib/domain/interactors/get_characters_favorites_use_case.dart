import 'package:rick_and_morty/domain/i_repository.dart';
import 'package:rick_and_morty/domain/interactors/base/base_use_case_future.dart';
import 'package:rick_and_morty/domain/model/character.dart';

class GetCharactersFavoritesUseCase extends BaseUseCaseFuture<void, List<Character>> {
  final IRepository repository;

  GetCharactersFavoritesUseCase({required this.repository});

  @override
  Future<List<Character>> block(void param) => repository.getCharactersFavorites();
}
