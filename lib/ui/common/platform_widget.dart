import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

abstract class PlatformWidget extends StatelessWidget {
  const PlatformWidget({super.key});

  @override
  Widget build(BuildContext context) => managementWidgetPlatform() ?? android();

  Widget? managementWidgetPlatform() {
    if (kIsWeb) {
      return web();
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return android();
        case TargetPlatform.iOS:
          return ios();
        case TargetPlatform.linux:
        case TargetPlatform.macOS:
        case TargetPlatform.windows:
          return desktop();
        default:
          return android();
      }
    }
  }

  @protected
  Widget android();

  @protected
  Widget? ios() => null;

  @protected
  Widget? desktop() => null;

  @protected
  Widget? web() => null;
}
