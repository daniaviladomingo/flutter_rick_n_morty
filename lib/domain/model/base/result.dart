import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success({required T data}) = _Success;

  const factory Result.error({required Exception error}) = _Error;
}

@freezed
class DomainError with _$DomainError {
  const factory DomainError.apiError({required ApiError apiError}) = _ApiError;
}

@freezed
class ApiError with _$ApiError{
  const factory ApiError.network() = _Network;
  const factory ApiError.notFound() = _NotFound;
  const factory ApiError.accessDenied() = _AccessDenied;
  const factory ApiError.serviceUnavailable() = _ServiceUnavailable;
}
