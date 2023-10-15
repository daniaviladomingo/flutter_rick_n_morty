import '../../model/login/user_credentials_entity.dart';
import '../../repository/i_repository.dart';
import '../base/base_use_case.dart';

class LoginUseCase extends BaseUseCaseIN<UserCredentialsEntity> {
  final IRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future block(UserCredentialsEntity param) => repository.login(param);
}
