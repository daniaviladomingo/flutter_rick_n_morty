import '../../model/base/result.dart';

abstract class BaseUseCaseStreamINOUT<IN, OUT> {
  Stream<Result<OUT>> invoke(IN param);
}

abstract class BaseUseCaseStreamOUT<OUT> {
  Stream<OUT> invoke();
}

abstract class BaseUseCaseStreamIN<IN> {
  Stream<Result<void>> invoke(IN param);
}

abstract class BaseUseCaseStream {
  Stream<Result<void>> invoke();
}