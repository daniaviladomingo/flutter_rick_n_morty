import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';


@freezed
class ApiLocation with _$ApiLocation {
  const factory ApiLocation({required String name, required String url}) =
      _ApiLocation;

  factory ApiLocation.fromJson(Map<String, dynamic> json) => _$ApiLocationFromJson(json);
}
