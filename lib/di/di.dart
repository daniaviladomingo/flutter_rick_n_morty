import 'package:common/common.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:rick_and_morty/navigation.dart';
import '../ui/screens/character_detail/bloc/character_detail_bloc.dart';
import '../ui/screens/characters/bloc/characters_bloc.dart';
import '../ui/screens/characters_favorites/bloc/characters_favorites_bloc.dart';

Future<void> initLocator() async {
  // Data
  await initDataLocator(onSessionExpired: () => logOut());

  // Domain
  initDomainLocator();

  // App
  getIt.registerSingleton(kReleaseMode);

  getIt.registerFactory(
    () => CharactersBloc(
      getCharactersUseCase: getIt<BaseUseCaseOUT<List<CharacterEntity>>>(),
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
      switchCharacterFavorite: getIt<BaseUseCaseINOUT<int, bool>>(instanceName: DomainInstanceNames.useCaseSwitchCharacterFavorite),
      isCharacterFavoriteUseCase: getIt<BaseUseCaseINOUT<int, bool>>(instanceName: DomainInstanceNames.useCaseIsCharacterFavorite),
      idCharacter: idCharacter,
    ),
  );
}
