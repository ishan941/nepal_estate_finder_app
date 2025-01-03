import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: '_id') @Default('') String id,
    @Default('') String username,
    @Default('') String email,
    @Default('') String bio,
    @Default('') String avatar,
    @JsonKey(fromJson: _fromJsonDateTime, toJson: _toJsonDateTime)
    DateTime? createdAt,
    @JsonKey(fromJson: _fromJsonDateTime, toJson: _toJsonDateTime)
    DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

// Helper functions for DateTime conversion
DateTime? _fromJsonDateTime(String? date) =>
    date != null ? DateTime.parse(date) : null;

String? _toJsonDateTime(DateTime? date) => date?.toIso8601String();
