import '../../common.dart';

sealed class DeviceError extends Cause {
  DeviceError(super.msg);
}
