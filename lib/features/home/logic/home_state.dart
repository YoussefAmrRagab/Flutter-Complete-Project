import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/specializations_response.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.specializations(List<Specialization> specializations) = Specializations;
  const factory HomeState.doctors(List<Doctor> doctors) = Doctors;
  const factory HomeState.error(String error) = Error;
}
