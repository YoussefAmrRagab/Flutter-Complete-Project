import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  int? code;
  String? message;
  @JsonKey(name: 'data')
  dynamic errors;

  ApiErrorModel({
    this.code,
    this.message,
    this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    dynamic errorsMessage;

    switch (json['data']) {
      case Map _:
        errorsMessage = Errors.fromJson(json['data']);
        break;
      case List _:
        final errors = json['data'] as List;
        errorsMessage = errors.isEmpty ? null : errors.join(', ');
        break;
      case String _:
        final errors = json['data'] as String;
        errorsMessage = errors.isEmpty ? null : errors;
        break;
      default:
        errorsMessage = null;
        break;
    }

    return ApiErrorModel(
      code: json['code'] ?? 'Unknown Code',
      message: json['message'] ?? 'Something went wrong..! Please try again.',
      errors: errorsMessage,
    );
  }
}

@JsonSerializable()
class Errors {
  List<String>? name;
  List<String>? email;
  List<String>? phone;
  List<String>? gender;
  List<String>? password;

  Errors({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.gender,
  });

  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);

  /// Returns a [String] containing all the error message
  String get message {
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
