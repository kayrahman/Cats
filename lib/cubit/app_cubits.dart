import 'package:bloc/bloc.dart';
import 'package:learning_dart/apimodule/api_service.dart';
import 'package:learning_dart/cubit/app_cubit_states.dart';
import 'package:learning_dart/model/data_model.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final List<Cat> cats;

  void fetchCats() async {
    print("app_cubit > fetchCats()");
    try {
      emit(LoadingState());
      cats = await data.fetchPhotos();
      emit(LoadedState(cats));
    } catch (e) {
      print("app_cubit > fetchCats() > $e");
    }
  }
}
