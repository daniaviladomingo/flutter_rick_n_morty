import 'package:flutter/foundation.dart';

abstract class BaseUseCaseStream<IN, OUT> {
  Stream<OUT> invoke(IN param) => block(param);

  @protected
  Stream<OUT> block(IN param);
}

abstract class BaseUseCaseStreamOUT<OUT> {
  Stream<OUT> invoke() => block();

  @protected
  Stream<OUT> block();
}
