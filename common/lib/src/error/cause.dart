abstract class Cause implements Exception {
  final String msg;
  const Cause(this.msg);
  @override
  String toString() => 'Cause: $msg';
}
