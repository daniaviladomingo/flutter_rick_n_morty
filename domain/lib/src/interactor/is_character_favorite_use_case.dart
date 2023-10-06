import '../repository/i_repository.dart';
import 'base/base_use_case.dart';

class IsCharacterFavoriteUseCase extends BaseUseCaseINOUT<int, bool> {
  final IRepository repository;

  IsCharacterFavoriteUseCase({required this.repository});

  @override
  Future<bool> block(int param) => repository.isCharacterFavorite(param);
}
