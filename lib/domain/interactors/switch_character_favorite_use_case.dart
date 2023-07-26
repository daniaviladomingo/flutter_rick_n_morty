import 'package:rick_and_morty/domain/i_repository.dart';
import 'package:rick_and_morty/domain/interactors/base/base_use_case_future.dart';

class SwitchCharacterFavoriteUseCase extends BaseUseCaseFuture<int, bool> {
  final IRepository repository;

  SwitchCharacterFavoriteUseCase({required this.repository});

  @override
  Future<bool> block(int param) async {
    if (await repository.isCharacterFavorite(param)) {
      await repository.removeCharacterFromFavorite(param);
    } else {
      await repository.addCharacterToFavorite(await repository.getCharacterDetail(param));
    }
    return repository.isCharacterFavorite(param);
  }
}
