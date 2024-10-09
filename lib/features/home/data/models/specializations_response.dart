import 'package:freezed_annotation/freezed_annotation.dart';

part 'specializations_response.g.dart';

@JsonSerializable()
class SpecializationsResponse {
  String message;
  @JsonKey(name: "data")
  List<Specialization> specializations;
  bool status;
  int code;

  SpecializationsResponse({
    required this.message,
    required this.specializations,
    required this.status,
    required this.code,
  });

  factory SpecializationsResponse.fromJson(Map<String, dynamic> json) =>
      _$SpecializationsResponseFromJson(json);
}

@JsonSerializable()
class Specialization {
  int id;
  String name;
  List<Doctor> doctors;

  Specialization({
    required this.id,
    required this.name,
    required this.doctors,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) =>
      _$SpecializationFromJson(json);
}

@JsonSerializable()
class Doctor {
  int id;
  String name;
  String email;
  String phone;
  String photo;
  String gender;
  String description;
  String degree;
  City city;
  @JsonKey(name: "appoint_price")
  int price;

  Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.gender,
    required this.description,
    required this.degree,
    required this.city,
    required this.price,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}

@JsonSerializable()
class City {
  String name;
  @JsonKey(name: "governrate")
  Governorate governorate;

  City({
    required this.name,
    required this.governorate,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@JsonSerializable()
class Governorate {
  String name;

  Governorate({
    required this.name,
  });

  factory Governorate.fromJson(Map<String, dynamic> json) =>
      _$GovernorateFromJson(json);
}
