import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_credentials_entity.freezed.dart';

@freezed
class UserCredentialsEntity with _$UserCredentialsEntity {
  const factory UserCredentialsEntity({
    required String user,
    required String password,
  }) = _UserCredentialsEntity;
}
