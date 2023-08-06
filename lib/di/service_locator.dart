import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rick_and_morty/common/mapper.dart';
import 'package:rick_and_morty/data/local/i_data_local.dart';
import 'package:rick_and_morty/data/remote/i_data_remote.dart';
import 'package:rick_and_morty/data/repository_imp.dart';
import 'package:rick_and_morty/data_local/data_local_imp.dart';
import 'package:rick_and_morty/data_local/model/db_character.dart';
import 'package:rick_and_morty/data_local/model/mapper/db_character_detail_mapper.dart';
import 'package:rick_and_morty/data_local/model/mapper/db_character_mapper.dart';
import 'package:rick_and_morty/data_remote/data_remote_imp.dart';
import 'package:rick_and_morty/data_remote/model/character.dart';
import 'package:rick_and_morty/data_remote/model/mapper/api_character_detail_mapper.dart';
import 'package:rick_and_morty/data_remote/model/mapper/api_character_mapper.dart';
import 'package:rick_and_morty/di/named_instances.dart';
import 'package:rick_and_morty/domain/i_repository.dart';
import 'package:rick_and_morty/domain/interactors/base/base_use_case_future.dart';
import 'package:rick_and_morty/domain/interactors/base/base_use_case_stream.dart';
import 'package:rick_and_morty/domain/interactors/get_character_detail_use_case.dart';
import 'package:rick_and_morty/domain/interactors/get_characters_favorites_use_case.dart';
import 'package:rick_and_morty/domain/interactors/get_characters_use_case.dart';
import 'package:rick_and_morty/domain/interactors/is_character_favorite_use_case.dart';
import 'package:rick_and_morty/domain/interactors/switch_character_favorite_use_case.dart';
import 'package:rick_and_morty/domain/model/character.dart';
import 'package:rick_and_morty/domain/model/character_detail.dart';
import 'package:rick_and_morty/ui/screens/character_detail/bloc/character_detail_bloc.dart';
import 'package:rick_and_morty/ui/screens/characters/bloc/characters_bloc.dart';
import 'package:rick_and_morty/ui/screens/characters_favorites/bloc/characters_favorites_bloc.dart';

final getIt = GetIt.instance;

Future<void> initLocator() async {
  final isar = await Isar.open(
    [DbCharacterSchema],
    directory: (await getApplicationDocumentsDirectory()).path,
  );
  // Bloc
  GetIt.I.registerFactory(() => CharactersBloc(
      getCharactersUseCase: getIt<BaseUseCaseFutureOUT<List<Character>>>(instanceName: useCaseCharacters))
  );
  GetIt.I.registerFactory(() => CharactersFavoritesBloc(
      getCharactersFavoritesStreamUseCase: getIt<BaseUseCaseStreamOUT<List<Character>>>())
  );
  GetIt.I.registerFactoryParam<CharacterDetailBloc, int, void>((idCharacter,_) => CharacterDetailBloc(
      getCharacterDetailUseCase: getIt<BaseUseCaseFuture<int, CharacterDetail>>(),
      switchCharacterFavorite: getIt<BaseUseCaseFuture<int, bool>>(instanceName: useCaseSwitchCharacterFavorite),
      isCharacterFavoriteUseCase: getIt<BaseUseCaseFuture<int,bool>>(instanceName: useCaseIsCharacterFavorite),
      idCharacter: idCharacter)
  );

  // UsesCases
  GetIt.I.registerFactory<BaseUseCaseFutureOUT<List<Character>>>(() => GetCharactersUseCase(
      repository: getIt<IRepository>()), instanceName: useCaseCharacters
  );
  GetIt.I.registerFactory<BaseUseCaseStreamOUT<List<Character>>>(() => GetCharactersFavoritesStreamUseCase(
      repository: getIt<IRepository>())
  );
  GetIt.I.registerFactory<BaseUseCaseFuture<int, CharacterDetail>>(()=> GetCharacterDetailUseCase(
      repository: getIt<IRepository>())
  );
  GetIt.I.registerFactory<BaseUseCaseFuture<int, bool>>(() => SwitchCharacterFavoriteUseCase(
      repository: getIt<IRepository>()), instanceName: useCaseSwitchCharacterFavorite
  );
  GetIt.I.registerFactory<BaseUseCaseFuture<int, bool>>(() => IsCharacterFavoriteUseCase(
      repository: getIt<IRepository>()), instanceName: useCaseIsCharacterFavorite
  );

  // Mappers
  GetIt.I.registerSingleton<Mapper<ApiCharacter, Character>>(ApiCharacterMapper());
  GetIt.I.registerSingleton<Mapper<ApiCharacter, CharacterDetail>>(ApiCharacterDetailMapper());
  GetIt.I.registerSingleton<Mapper<DbCharacter, Character>>(DbCharacterMapper());
  GetIt.I.registerSingleton<Mapper<CharacterDetail, DbCharacter>>(DbCharacterDetailMapper());

  // Data
  GetIt.I.registerSingleton<IDataRemote>(DataRemoteImp(
      httpClient: http.Client(),
      characterMapper: getIt<Mapper<ApiCharacter, Character>>(),
      characterDetailMapper: getIt<Mapper<ApiCharacter, CharacterDetail>>())
  );
  GetIt.I.registerSingleton<IDataLocal>(DataLocalImp(
      isar: isar,
      characterDbMapper: getIt<Mapper<DbCharacter, Character>>(),
      characterDetailDbMapper: getIt<Mapper<CharacterDetail, DbCharacter>>())
  );
  GetIt.I.registerSingleton<IRepository>(RepositoryImp(
      dataRemote: getIt<IDataRemote>(),
      dataLocal: getIt<IDataLocal>())
  );
}