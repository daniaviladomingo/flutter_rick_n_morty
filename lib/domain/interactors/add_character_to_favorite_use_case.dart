
import 'package:rick_and_morty/domain/i_repository.dart';
import 'package:rick_and_morty/domain/interactors/base/base_use_case_future.dart';
import 'package:rick_and_morty/domain/model/character.dart';
import 'package:rick_and_morty/domain/model/character_detail.dart';

class AddCharacterFromFavoriteUseCase extends BaseUseCaseFuture<CharacterDetail, void> {
  final IRepository repository;

  AddCharacterFromFavoriteUseCase({required this.repository});

  @override
  Future<void> block(CharacterDetail param) => repository.addCharacterToFavorite(param);

}
