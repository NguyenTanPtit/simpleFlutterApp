// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      (json['id'] as num).toInt(),
      json['username'] as String,
      json['email'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
      json['gender'] as String,
      json['image'] as String,
      json['accessToken'] as String,
      json['refreshToken'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'image': instance.image,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
