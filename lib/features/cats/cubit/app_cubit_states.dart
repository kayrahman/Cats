import 'package:equatable/equatable.dart';

import '../model/data_model.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WelcomeState extends CubitStates{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingState extends CubitStates{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedState extends CubitStates{
  LoadedState(this.cats);
  final List<Cat> cats;
  @override
  List<Object?> get props => [cats];
}