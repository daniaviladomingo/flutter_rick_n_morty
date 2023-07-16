import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_ui_state.freezed.dart';

@freezed
class BaseUiState<T> with _$BaseUiState<T> {
  const factory BaseUiState.idle() = _Idle;

  const factory BaseUiState.loading() = _Loading;

  const factory BaseUiState.error({required Exception error}) = _Error;

  const factory BaseUiState.success({required T data}) = _Success;
}

extension BaseUiStateExtension<T> on BaseUiState<T> {
  Future<void> handleSuccess(void Function(T data) onData) async =>
      when(
          idle: () => { },
          loading: () => { },
          error: (_) => { },
          success: (data) => onData(data)
      );
}