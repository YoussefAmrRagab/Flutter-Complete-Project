import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  int? code;
  String? message;
  @JsonKey(name: 'data')
  dynamic errorDetails;

  ApiErrorModel({
    this.code,
    this.message,
    this.errorDetails,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    dynamic errorDetails;

    if (json['data'] is Map) {
      errorDetails = ErrorDetails.fromJson(json['data']);
    } else if (json['data'] is List) {
      final errors = json['data'] as List;
      errorDetails = errors.isEmpty ? null : errors.join(', ');
    }

    return ApiErrorModel(
      code: json['code'] ?? 'Unknown Code',
      message: json['message'] ?? 'Some thing went wrong..! Please try again.',
      errorDetails: errorDetails,
    );
  }
}

@JsonSerializable()
class ErrorDetails {
  List<String>? name;
  List<String>? email;
  List<String>? phone;
  List<String>? gender;
  List<String>? password;

  ErrorDetails({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.gender,
  });

  factory ErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailsFromJson(json);

  @override
  String toString() {
    String errorMsg(List<String>? field) {
      return (field != null && field.isNotEmpty) ? field.join(', ') : '';
    }

    return [
      errorMsg(name),
      errorMsg(email),
      errorMsg(phone),
      errorMsg(gender),
      errorMsg(password),
    ].where((element) => element.isNotEmpty).join('\n');
  }
}
