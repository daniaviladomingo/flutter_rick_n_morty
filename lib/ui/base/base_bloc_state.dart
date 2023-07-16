import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_bloc_state.freezed.dart';

@freezed
class BaseBlocState<T> with _$BaseBlocState<T> {
  const factory BaseBlocState.idle() = _Idle;

  const factory BaseBlocState.loading() = _Loading;

  const factory BaseBlocState.error({required Exception error}) = _Error;

  const factory BaseBlocState.success({required T data}) = _Success;
}

extension BaseBlocStateExtension<T> on BaseBlocState<T> {
  BaseBlocState<T> handleSuccess(T Function(T) onData) =>
      when(
          idle: () => this,
          loading: () => this,
          error: (_) => this,
          success: (data) => BaseBlocState.success(data: onData(data))
      );
}
