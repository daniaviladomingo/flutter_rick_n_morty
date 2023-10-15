import 'package:common/common.dart';
import '../use_case/base/base_use_case.dart';
import '../use_case/base/base_use_case_stream.dart';
import '../use_case/get_character_detail_use_case.dart';
import '../use_case/get_characters_favorites_use_case.dart';
import '../use_case/get_characters_use_case.dart';
import '../use_case/is_character_favorite_use_case.dart';
import '../use_case/switch_character_favorite_use_case.dart';
import '../model/character_entity.dart';
import '../model/character_detail_entity.dart';
import '../repository/i_repository.dart';
import 'instance_names.dart';

void initDomainLocator() {
  getIt.registerFactory<BaseUseCaseOUT<List<CharacterEntity>>>(() => GetCharactersUseCase(repository: getIt<IRepository>()));
  getIt.registerFactory<BaseUseCaseStreamOUT<List<CharacterEntity>>>(() => GetCharactersFavoritesStreamUseCase(repository: getIt<IRepository>()));
  getIt.registerFactory<BaseUseCaseINOUT<int, CharacterDetailEntity>>(() => GetCharacterDetailUseCase(repository: getIt<IRepository>()));
  getIt.registerFactory<BaseUseCaseINOUT<int, bool>>(() => SwitchCharacterFavoriteUseCase(repository: getIt<IRepository>()), instanceName: DomainInstanceNames.useCaseSwitchCharacterFavorite);
  getIt.registerFactory<BaseUseCaseINOUT<int, bool>>(() => IsCharacterFavoriteUseCase(repository: getIt<IRepository>()), instanceName: DomainInstanceNames.useCaseIsCharacterFavorite);
}
