import 'package:common/common.dart';
import 'package:data/src/di/instance_names.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../data_sources/local/i_db.dart';
import '../data_sources/remote/i_ss_api.dart';
import '../data_sources/local/db/db_imp.dart';
import '../data_sources/local/db/model/db_character.dart';
import '../data_sources/local/db/model/mapper/db_character_detail_mapper.dart';
import '../data_sources/local/db/model/mapper/db_character_mapper.dart';
import '../data_sources/remote/ss_api/model/api_character.dart';
import '../data_sources/remote/ss_api/model/mapper/api_character_detail_mapper.dart';
import '../data_sources/remote/ss_api/model/mapper/api_character_mapper.dart';
import '../data_sources/remote/ss_api/ss_api_imp.dart';
import '../repository_imp.dart';

final securedKeyRefreshToken = "secured_key_refresh_token";

Future<void> initDataLocator({required void Function() onSessionExpired}) async {
  final isar = await Isar.open(
    [DbCharacterSchema],
    directory: (await getApplicationDocumentsDirectory()).path,
  );

  // Mappers
  getIt.registerSingleton<Mapper<ApiCharacter, CharacterEntity>>(ApiCharacterMapper());
  getIt.registerSingleton<Mapper<ApiCharacter, CharacterDetailEntity>>(ApiCharacterDetailMapper());
  getIt.registerSingleton<Mapper<DbCharacter, CharacterEntity>>(DbCharacterMapper());
  getIt.registerSingleton<Mapper<DbCharacter, CharacterDetailEntity>>(DbCharacterDetailMapper());

  // Data Local
  // Db
  getIt.registerSingleton<IDB>(
    DataLocalImp(
      isar: isar,
      characterDbMapper: getIt<Mapper<DbCharacter, CharacterEntity>>(),
      characterDetailDbMapper: getIt<Mapper<DbCharacter, CharacterDetailEntity>>(),
    ),
  );

  // Secure Preferences
  getIt.registerSingleton(FlutterSecureStorage());

  // Data Remote
  getIt.registerSingleton(
    BaseOptions(
      baseUrl: "https://rickandmortyapi.com/api/",
      contentType: Headers.jsonContentType,
    ),
  );
  getIt.registerSingleton<Interceptor>(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
    ),
  );
  getIt.registerSingleton<Dio>(Dio(getIt())..interceptors.add(getIt()));
  getIt.registerSingleton<ISSApi>(
    DataRemoteImp(
      dio: getIt(),
      secureStorage: getIt(),
      securedKeyRefreshToken: securedKeyRefreshToken,
      onSessionExpired: onSessionExpired,
      characterMapper: getIt<Mapper<ApiCharacter, CharacterEntity>>(),
      characterDetailMapper: getIt<Mapper<ApiCharacter, CharacterDetailEntity>>(),
    ),
  );

  // Data
  getIt.registerSingleton<IRepository>(
    RepositoryImp(
      sSApi: getIt<ISSApi>(),
      db: getIt<IDB>(),
    ),
  );

  getIt.registerFactoryAsync<bool>(
    () async {
      return await getIt<FlutterSecureStorage>().read(key: securedKeyRefreshToken) != null;
    },
    instanceName: DataInstanceNames.isLogged,
  );
}
