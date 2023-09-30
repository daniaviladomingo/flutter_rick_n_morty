import 'package:flutter/foundation.dart';

import '../../model/base/result.dart';

abstract class BaseUseCaseFuture<IN, OUT> {
  Future<Result<OUT>> invoke(IN param) async {
    try {
      return Result.success(data: await block(param));
    } on Error catch (e) {
      return Result.error(error: Exception(e.stackTrace));
    } on Exception catch (e) {
      return Result.error(error: e);
    }
  }

  @protected
  Future<OUT> block(IN param);
}

abstract class BaseUseCaseFutureOUT<OUT> {
  Future<Result<OUT>> invoke() async {
    try {
      return Result.success(data: await block());
    } on Error catch (e) {
      return Result.error(error: Exception(e.stackTrace));
    } on Exception catch (e) {
      return Result.error(error: e);
    }
  }

  @protected
  Future<OUT> block();
}
