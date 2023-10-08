import 'package:common/common.dart';

import '../../model/base/result.dart';

abstract class BaseUseCaseINOUT<IN, OUT> {
  Future<Result<OUT>> invoke(IN param) async {
    try {
      return Result.success(data: await block(param));
    } on Cause catch (e) {
      return Result.failure(reason: Reason.system(cause: e));
    }
  }

  Future<OUT> block(IN param);
}

abstract class BaseUseCaseOUT<OUT> {
  Future<Result<OUT>> invoke() async {
    try {
      return Result.success(data: await block());
    } on Cause catch (e) {
      return Result.failure(reason: Reason.system(cause: e));
    }
  }

  Future<OUT> block();
}

abstract class BaseUseCaseIN<IN> {
  Future<Result> invoke(IN param) async {
    try {
      return Result.success(data: await block(param));
    } on Cause catch (e) {
      return Result.failure(reason: Reason.system(cause: e));
    }
  }


  Future block(IN param);
}

abstract class BaseUseCase {
  Future<Result> invoke() async {
    // for i to 10
    try {
      return Result.success(data: await block());
    } on Cause catch (e) {
      return Result.failure(reason: Reason.system(cause: e));
    }
  }

  Future block();
}
