import 'package:common/common.dart';
import '../interactor/base/base_use_case.dart';
import '../interactor/base/base_use_case_stream.dart';
import '../interactor/get_character_detail_use_case.dart';
import '../interactor/get_characters_favorites_use_case.dart';
import '../interactor/get_characters_use_case.dart';
import '../interactor/is_character_favorite_use_case.dart';
import '../interactor/switch_character_favorite_use_case.dart';
import '../model/character_entity.dart';
import '../model/character_detail_entity.dart';
import '../repository/i_repository.dart';
import 'named_instances.dart';

void initDomainLocator() {
  getIt.registerFactory<BaseUseCaseOUT<List<CharacterEntity>>>(() => GetCharactersUseCase(repository: getIt<IRepository>()), instanceName: useCaseCharacters);
  getIt.registerFactory<BaseUseCaseStreamOUT<List<CharacterEntity>>>(() => GetCharactersFavoritesStreamUseCase(repository: getIt<IRepository>()));
  getIt.registerFactory<BaseUseCaseINOUT<int, CharacterDetailEntity>>(() => GetCharacterDetailUseCase(repository: getIt<IRepository>()));
  getIt.registerFactory<BaseUseCaseINOUT<int, bool>>(() => SwitchCharacterFavoriteUseCase(repository: getIt<IRepository>()), instanceName: useCaseSwitchCharacterFavorite);
  getIt.registerFactory<BaseUseCaseINOUT<int, bool>>(() => IsCharacterFavoriteUseCase(repository: getIt<IRepository>()), instanceName: useCaseIsCharacterFavorite);
}
