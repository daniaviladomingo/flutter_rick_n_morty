import 'package:rick_and_morty/domain/i_repository.dart';
import 'package:rick_and_morty/domain/interactors/base/base_use_case_future.dart';
import 'package:rick_and_morty/domain/model/character_detail.dart';

class GetCharacterDetailUseCase extends BaseUseCaseFuture<int, CharacterDetail> {
  final IRepository repository;

  GetCharacterDetailUseCase({required this.repository});

  @override
  Future<CharacterDetail> block(int param) => repository.getCharacterDetail(param);
}
