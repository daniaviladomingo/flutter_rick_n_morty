import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import '../data_local/data_local_imp.dart';
import '../data_local/model/db_character.dart';
import '../data_local/model/mapper/db_character_detail_mapper.dart';
import '../data_local/model/mapper/db_character_mapper.dart';
import '../data_remote/data_remote_imp.dart';
import '../data_remote/model/api_character.dart';
import '../data_remote/model/mapper/api_character_detail_mapper.dart';
import '../data_remote/model/mapper/api_character_mapper.dart';
import '../i_data_local.dart';
import '../i_data_remote.dart';
import '../repository_imp.dart';

Future<void> initDataLocator() async {
  final isar = await Isar.open(
      [DbCharacterSchema],
      directory: (await getApplicationDocumentsDirectory()).path,
  );

  // Mappers
  getIt.registerSingleton<Mapper<ApiCharacter, CharacterEntity>>(ApiCharacterMapper());
  getIt.registerSingleton<Mapper<ApiCharacter, CharacterDetailEntity>>(ApiCharacterDetailMapper());
  getIt.registerSingleton<Mapper<DbCharacter, CharacterEntity>>(DbCharacterMapper());
  getIt.registerSingleton<Mapper<DbCharacter, CharacterDetailEntity>>(DbCharacterDetailMapper());

  // Data
  getIt.registerSingleton<IDataRemote>(
    DataRemoteImp(
      httpClient: http.Client(),
      characterMapper: getIt<Mapper<ApiCharacter, CharacterEntity>>(),
      characterDetailMapper: getIt<Mapper<ApiCharacter, CharacterDetailEntity>>(),
    ),
  );
  getIt.registerSingleton<IDataLocal>(
    DataLocalImp(
      isar: isar,
      characterDbMapper: getIt<Mapper<DbCharacter, CharacterEntity>>(),
      characterDetailDbMapper: getIt<Mapper<DbCharacter, CharacterDetailEntity>>(),
    ),
  );
  getIt.registerSingleton<IRepository>(
    RepositoryImp(
      dataRemote: getIt<IDataRemote>(),
      dataLocal: getIt<IDataLocal>(),
    ),
  );
}