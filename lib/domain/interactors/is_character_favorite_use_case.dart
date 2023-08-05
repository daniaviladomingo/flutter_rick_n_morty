
import 'package:rick_and_morty/domain/i_repository.dart';
import 'package:rick_and_morty/domain/interactors/base/base_use_case_future.dart';

class IsCharacterFavoriteUseCase extends BaseUseCaseFuture<int, bool> {
  final IRepository repository;

  IsCharacterFavoriteUseCase({required this.repository});

  @override
  Future<bool> block(int param) => repository.isCharacterFavorite(param);

}
