import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../data/local/i_data_local.dart';
import '../data/remote/i_data_remote.dart';
import '../data/repository_imp.dart';
import '../data_local/data_local_imp.dart';
import '../data_local/model/db_character.dart';
import '../data_local/model/mapper/db_character_detail_mapper.dart';
import '../data_local/model/mapper/db_character_mapper.dart';
import '../data_remote/data_remote_imp.dart';
import '../data_remote/model/api_character.dart';
import '../data_remote/model/mapper/api_character_detail_mapper.dart';
import '../data_remote/model/mapper/api_character_mapper.dart';
import '../ui/screens/character_detail/bloc/character_detail_bloc.dart';
import '../ui/screens/characters/bloc/characters_bloc.dart';
import '../ui/screens/characters_favorites/bloc/characters_favorites_bloc.dart';


Future<void> initLocator() async {
  final isar = await Isar.open(
    [DbCharacterSchema],
    directory: (await getApplicationDocumentsDirectory()).path,
  );
  // Bloc
  GetIt.I.registerFactory(
    () => CharactersBloc(
      getCharactersUseCase: getIt<BaseUseCaseOUT<List<CharacterEntity>>>(instanceName: useCaseCharacters),
    ),
  );
  GetIt.I.registerFactory(
    () => CharactersFavoritesBloc(
      getCharactersFavoritesStreamUseCase: getIt<BaseUseCaseStreamOUT<List<CharacterEntity>>>(),
    ),
  );
  GetIt.I.registerFactoryParam<CharacterDetailBloc, int, void>(
    (idCharacter, _) => CharacterDetailBloc(
      getCharacterDetailUseCase: getIt<BaseUseCaseINOUT<int, CharacterDetailEntity>>(),
      switchCharacterFavorite: getIt<BaseUseCaseINOUT<int, bool>>(instanceName: useCaseSwitchCharacterFavorite),
      isCharacterFavoriteUseCase: getIt<BaseUseCaseINOUT<int, bool>>(instanceName: useCaseIsCharacterFavorite),
      idCharacter: idCharacter,
    ),
  );

  // UsesCases
  initDomainLocator();

  // Mappers
  GetIt.I.registerSingleton<Mapper<ApiCharacter, CharacterEntity>>(ApiCharacterMapper());
  GetIt.I.registerSingleton<Mapper<ApiCharacter, CharacterDetailEntity>>(ApiCharacterDetailMapper());
  GetIt.I.registerSingleton<Mapper<DbCharacter, CharacterEntity>>(DbCharacterMapper());
  GetIt.I.registerSingleton<Mapper<CharacterDetailEntity, DbCharacter>>(DbCharacterDetailMapper());

  // Data
  GetIt.I.registerSingleton<IDataRemote>(
    DataRemoteImp(
      httpClient: http.Client(),
      characterMapper: getIt<Mapper<ApiCharacter, CharacterEntity>>(),
      characterDetailMapper: getIt<Mapper<ApiCharacter, CharacterDetailEntity>>(),
    ),
  );
  GetIt.I.registerSingleton<IDataLocal>(
    DataLocalImp(
      isar: isar,
      characterDbMapper: getIt<Mapper<DbCharacter, CharacterEntity>>(),
      characterDetailDbMapper: getIt<Mapper<CharacterDetailEntity, DbCharacter>>(),
    ),
  );
  GetIt.I.registerSingleton<IRepository>(
    RepositoryImp(
      dataRemote: getIt<IDataRemote>(),
      dataLocal: getIt<IDataLocal>(),
    ),
  );
}
