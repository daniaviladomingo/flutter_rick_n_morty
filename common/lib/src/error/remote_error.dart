sealed class RemoteError implements Exception {
  final String msg;
  const RemoteError(this.msg);
}

class GenericRemoteError extends RemoteError {
  GenericRemoteError(super.msg);
}

class Unauthorized extends RemoteError {
  Unauthorized(super.msg);
}