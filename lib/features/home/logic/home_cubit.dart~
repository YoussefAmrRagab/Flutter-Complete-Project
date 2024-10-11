import '../data/models/specializations_response.dart';
import 'home_state.dart';
import '../data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<Specialization> specializations = [];

  Future<void> getSpecializations() async {
    emit(const HomeState.loading());
    final response = await _homeRepo.getSpecializations();
    response.when(
      success: (data) {
        specializations = data.specializations;
        filterDoctorsBySpecializationId(specializations.first.id);
        emit(HomeState.specializations(specializations));
      },
      failure: (error) => emit(HomeState.error(error.message)),
    );
  }

  void filterDoctorsBySpecializationId(int specializationId) {
    List<Doctor> doctors = specializations
        .firstWhere((element) => element.id == specializationId)
        .doctors;
    emit(HomeState.doctors(doctors));
  }
}
