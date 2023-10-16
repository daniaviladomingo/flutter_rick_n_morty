import 'dart:async';
import 'dart:io';
import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../i_ss_api.dart';
import 'model/api_character.dart';
import 'model/api_characters_result.dart';

class DataRemoteImp implements ISSApi {
  final Dio dio;
  final FlutterSecureStorage secureStorage;
  final String securedKeyRefreshToken;
  final void Function() onSessionExpired;
  final Mapper<ApiCharacter, CharacterEntity> characterMapper;
  final Mapper<ApiCharacter, CharacterDetailEntity> characterDetailMapper;

  String? accessToken;

  DataRemoteImp({
    required this.dio,
    required this.secureStorage,
    required this.securedKeyRefreshToken,
    required this.onSessionExpired,
    required this.characterMapper,
    required this.characterDetailMapper,
  }) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers["Accept"] = "application/json";
          options.headers["Authorization"] = "Bearer $accessToken";
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == HttpStatus.unauthorized) {
            await refreshToken();
            if (accessToken != null) {
              dio.options.headers["Authorization"] = "Bearer $accessToken";
              return handler.resolve(await dio.fetch(error.requestOptions));
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  @override
  Future<List<CharacterEntity>> getCharacters() async {
    final response = await dio.get("character").getDataOrError();
    final ApiCharactersResult result = ApiCharactersResult.fromJson(response.data);
    return characterMapper.mapList(result.results);
  }

  @override
  Future<CharacterDetailEntity> getCharacterDetail(int idCharacter) async {
    final response = await dio.get("character/$idCharacter").getDataOrError();
    final ApiCharacter result = ApiCharacter.fromJson(response.data);
    return characterDetailMapper.map(result);
  }

  @override
  Future<void> login(UserCredentialsEntity credentials) async {
    final response = await dio.post("auth/login", data: credentials).getDataOrError();
    accessToken = response.data['accessToken'];
    final refreshToken = response.data['refreshToken'];
    await secureStorage.write(key: securedKeyRefreshToken, value: refreshToken);
    isLogged = true;
  }
}

extension DataRemoteImpExtension on DataRemoteImp {
  Future<void> refreshToken() async {
    try {
      final refreshToken = await secureStorage.read(key: securedKeyRefreshToken);
      final response = await dio.post(
        "auth/refresh-token",
        options: Options(headers: {"Token": refreshToken}),
      );
      accessToken = response.data['accessToken'];
      final newRefreshToken = response.data['refreshToken'];
      await secureStorage.write(key: securedKeyRefreshToken, value: newRefreshToken);
    } catch (_) {
      isLogged = false;
      accessToken = null;
      await secureStorage.delete(key: securedKeyRefreshToken);
      onSessionExpired();
    }
  }
}

extension ResponseExtension on Future<Response> {
  Future<Response> getDataOrError() async {
    try {
      return await this;
    } on DioException catch (e) {
      switch (e.response?.statusCode) {
        case HttpStatus.ok:
          throw Unauthorized(e.toString());
        default:
          throw GenericRemoteError(e.toString());
      }
    }
  }
}
