// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
  names: json['names'] as String?,
  lastNames: json['lastNames'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  birthDate:
      json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
  gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
);

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
  'names': instance.names,
  'lastNames': instance.lastNames,
  'email': instance.email,
  'phone': instance.phone,
  'birthDate': instance.birthDate?.toIso8601String(),
  'gender': _$GenderEnumMap[instance.gender],
};

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
};
