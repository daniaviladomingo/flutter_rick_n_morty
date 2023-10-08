import 'package:common/common.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import '../ui/screens/character_detail/bloc/character_detail_bloc.dart';
import '../ui/screens/characters/bloc/characters_bloc.dart';
import '../ui/screens/characters_favorites/bloc/characters_favorites_bloc.dart';

Future<void> initLocator() async {
  // Data
  await initDataLocator();

  // Domain
  initDomainLocator();

  // App
  getIt.registerFactory(
    () => CharactersBloc(
      getCharactersUseCase: getIt<BaseUseCaseOUT<List<CharacterEntity>>>(instanceName: useCaseCharacters),
    ),
  );
  getIt.registerFactory(
    () => CharactersFavoritesBloc(
      getCharactersFavoritesStreamUseCase: getIt<BaseUseCaseStreamOUT<List<CharacterEntity>>>(),
    ),
  );
  getIt.registerFactoryParam<CharacterDetailBloc, int, void>(
    (idCharacter, _) => CharacterDetailBloc(
      getCharacterDetailUseCase: getIt<BaseUseCaseINOUT<int, CharacterDetailEntity>>(),
      switchCharacterFavorite: getIt<BaseUseCaseINOUT<int, bool>>(instanceName: useCaseSwitchCharacterFavorite),
      isCharacterFavoriteUseCase: getIt<BaseUseCaseINOUT<int, bool>>(instanceName: useCaseIsCharacterFavorite),
      idCharacter: idCharacter,
    ),
  );
}
