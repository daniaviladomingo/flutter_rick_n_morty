import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_ui_state.freezed.dart';

@freezed
class BaseUiState<T> with _$BaseUiState<T> {
  const factory BaseUiState.idle() = _Idle;

  const factory BaseUiState.loading() = _Loading;

  const factory BaseUiState.empty() = _Empty;

  const factory BaseUiState.error({required Exception error}) = _Error;

  const factory BaseUiState.success({required T data}) = _Success;
}