import '../../common.dart';

sealed class RemoteError extends Cause {
  RemoteError(super.msg);
}

class GenericRemoteError extends RemoteError {
  GenericRemoteError(super.msg);
}