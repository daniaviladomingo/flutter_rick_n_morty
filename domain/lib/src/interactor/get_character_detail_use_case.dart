import '../model/character_detail_entity.dart';
import '../repository/i_repository.dart';
import 'base/base_use_case.dart';

class GetCharacterDetailUseCase extends BaseUseCaseINOUT<int, CharacterDetailEntity> {
  final IRepository repository;

  GetCharacterDetailUseCase({required this.repository});

  @override
  Future<CharacterDetailEntity> block(int param) => repository.getCharacterDetail(param);
}
