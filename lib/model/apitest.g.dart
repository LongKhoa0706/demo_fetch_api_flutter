// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apitest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Apitest _$ApitestFromJson(Map<String, dynamic> json) {
  return Apitest(
    id: json['id'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    gender: json['gender'] as String,
    dob: json['dob'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    website: json['website'] as String,
    address: json['address'] as String,
    status: json['status'] as String,
    lLinks: json['lLinks'] == null
        ? null
        : Links.fromJson(json['lLinks'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ApitestToJson(Apitest instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'dob': instance.dob,
      'email': instance.email,
      'phone': instance.phone,
      'website': instance.website,
      'address': instance.address,
      'status': instance.status,
      'lLinks': instance.lLinks,
    };
