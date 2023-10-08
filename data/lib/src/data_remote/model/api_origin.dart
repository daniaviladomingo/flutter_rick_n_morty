import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_origin.freezed.dart';
part 'api_origin.g.dart';

@freezed
class ApiOrigin with _$ApiOrigin {
  const factory ApiOrigin({required String name, required String url}) = _ApiOrigin;

  factory ApiOrigin.fromJson(Map<String, dynamic> json) => _$ApiOriginFromJson(json);
}