import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success({required T data}) = _Success;

  const factory Result.failure({required Reason reason}) = _Failure;
}

@freezed
class Reason with _$Reason {
  const factory Reason.domain() = _Domain;

  const factory Reason.system({required Cause cause}) = _System;
}

extension FutureResultExtension<I, O extends Object> on Future<Result<I>> {
  Future<Result<O>> mapOnSuccess(Result<O> Function(I data) transform) async {
    return (await this).map(
      success: (success) {
        return Future(() => transform(success.data));
      },
      failure: (failure) {
        return Future(() => Result.failure(reason: failure.reason));
      },
    );
  }
}

extension ResultExtension<I, O extends Object> on Result<I> {
  Result<O> mapOnSuccess(O Function(I data) transform) {
    return (this).map(
      success: (data) {
        return Result.success(data: transform(data.data));
      },
      failure: (failure) {
        return Result.failure(reason: failure.reason);
      },
    );
  }
}