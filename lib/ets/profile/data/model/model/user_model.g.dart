// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['_id'] as String? ?? '',
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      bio: json['bio'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      createdAt: _fromJsonDateTime(json['createdAt'] as String?),
      updatedAt: _fromJsonDateTime(json['updatedAt'] as String?),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'bio': instance.bio,
      'avatar': instance.avatar,
      'createdAt': _toJsonDateTime(instance.createdAt),
      'updatedAt': _toJsonDateTime(instance.updatedAt),
    };
