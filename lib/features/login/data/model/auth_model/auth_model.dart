import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthModel with _$AuthModel {
  const factory AuthModel({
    @JsonKey(name: '_id') String? id,
    String? username,
    String? email,
    String? bio,
    String? avatar,
    DateTime? createdAt,
    DateTime? updatedAt,
    @JsonKey(name: '__v') int? version,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}
