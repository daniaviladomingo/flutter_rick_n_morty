import '../repository/i_repository.dart';
import 'base/base_use_case.dart';

class SwitchCharacterFavoriteUseCase extends BaseUseCaseINOUT<int, bool> {
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
