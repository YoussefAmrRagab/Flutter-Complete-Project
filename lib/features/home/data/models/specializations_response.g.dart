// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specializations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecializationsResponse _$SpecializationsResponseFromJson(
        Map<String, dynamic> json) =>
    SpecializationsResponse(
      message: json['message'] as String,
      specializations: (json['data'] as List<dynamic>)
          .map((e) => Specialization.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$SpecializationsResponseToJson(
        SpecializationsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.specializations,
      'status': instance.status,
      'code': instance.code,
    };

Specialization _$SpecializationFromJson(Map<String, dynamic> json) =>
    Specialization(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      doctors: (json['doctors'] as List<dynamic>)
          .map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecializationToJson(Specialization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'doctors': instance.doctors,
    };

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      photo: json['photo'] as String,
      gender: json['gender'] as String,
      description: json['description'] as String,
      degree: json['degree'] as String,
      city: City.fromJson(json['city'] as Map<String, dynamic>),
      price: (json['appoint_price'] as num).toInt(),
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'photo': instance.photo,
      'gender': instance.gender,
      'description': instance.description,
      'degree': instance.degree,
      'city': instance.city,
      'appoint_price': instance.price,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      name: json['name'] as String,
      governorate:
          Governorate.fromJson(json['governrate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'name': instance.name,
      'governrate': instance.governorate,
    };

Governorate _$GovernorateFromJson(Map<String, dynamic> json) => Governorate(
      name: json['name'] as String,
    );

Map<String, dynamic> _$GovernorateToJson(Governorate instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
