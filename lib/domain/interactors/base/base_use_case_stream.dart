abstract class BaseUseCaseStream<IN, OUT> {
  Stream<OUT> invoke(IN param) => block(param);

  Stream<OUT> block(IN param);
}
