import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'resources_ui_state.freezed.dart';

@freezed
class ResourceUiState<T> with _$ResourceUiState<T> {
  const factory ResourceUiState.idle() = _Idle;

  const factory ResourceUiState.loading() = _Loading;

  const factory ResourceUiState.empty() = _Empty;

  const factory ResourceUiState.failure({required Reason reason}) = _Failure;

  const factory ResourceUiState.success({required T data}) = _Success;
}