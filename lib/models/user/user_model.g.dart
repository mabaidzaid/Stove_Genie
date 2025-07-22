// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] == null ? "" : _stringFromAny(json['id']),
      name: json['name'] == null ? "" : _stringFromAny(json['name']),
      email: json['email'] == null ? "" : _stringFromAny(json['email']),
      number: json['number'] == null ? "" : _stringFromAny(json['number']),
      city: json['city'] == null ? "" : _stringFromAny(json['city']),
      licenseId:
          json['licenseId'] == null ? "" : _stringFromAny(json['licenseId']),
      service: json['service'] == null ? "" : _stringFromAny(json['service']),
      image: json['image'] == null ? "" : _stringFromAny(json['image']),
      notifications: json['notifications'] == null
          ? false
          : _boolFromAny(json['notifications']),
      pushToken:
          json['pushToken'] == null ? "" : _stringFromAny(json['pushToken']),
      state: json['state'] == null ? "" : _stringFromAny(json['state']),
      online: json['online'] == null ? false : _boolFromAny(json['online']),
      createdAt:
          json['createdAt'] == null ? "" : _stringFromAny(json['createdAt']),
      price: json['price'] == null ? 0.0 : _doubleFromAny(json['price']),
      experience:
          json['experience'] == null ? 0.0 : _doubleFromAny(json['experience']),
      orderCompleted: json['orderCompleted'] == null
          ? 0
          : _intFromAny(json['orderCompleted']),
      bio: json['bio'] == null ? "" : _stringFromAny(json['bio']),
      rating: json['rating'] == null ? 0.0 : _doubleFromAny(json['rating']),
      skills: json['skills'] == null
          ? const <String>[]
          : _stringListFromAny(json['skills']),
      followers: json['followers'] == null ? 0 : _intFromAny(json['followers']),
      following: json['following'] == null ? 0 : _intFromAny(json['following']),
      uploadedRecipesCount: json['uploadedRecipesCount'] == null
          ? 0
          : _intFromAny(json['uploadedRecipesCount']),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'number': instance.number,
      'city': instance.city,
      'licenseId': instance.licenseId,
      'service': instance.service,
      'image': instance.image,
      'notifications': instance.notifications,
      'pushToken': instance.pushToken,
      'state': instance.state,
      'online': instance.online,
      'createdAt': instance.createdAt,
      'price': instance.price,
      'experience': instance.experience,
      'orderCompleted': instance.orderCompleted,
      'bio': instance.bio,
      'rating': instance.rating,
      'skills': instance.skills,
      'followers': instance.followers,
      'following': instance.following,
      'uploadedRecipesCount': instance.uploadedRecipesCount,
    };
