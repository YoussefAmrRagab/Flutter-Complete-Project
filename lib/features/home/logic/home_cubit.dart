import 'home_state.dart';
import '../data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  Future<void> getSpecializations() async {
    emit(const HomeState.loading());
    final response = await _homeRepo.getSpecializations();
    response.when(
      success: (data) => emit(HomeState.success(data)),
      failure: (error) => emit(HomeState.error(error.message)),
    );
  }
}
