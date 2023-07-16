import 'package:rick_and_morty/domain/i_repository.dart';
import 'package:rick_and_morty/domain/interactors/base/base_use_case_future.dart';

class RemoveCharacterFromFavoriteUseCase extends BaseUseCaseFuture<int, void> {
  final IRepository repository;

  RemoveCharacterFromFavoriteUseCase({required this.repository});

  @override
  Future<void> block(int param) => repository.removeCharacterFromFavorite(param);

}
