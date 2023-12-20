part of 'create_cook_bloc.dart';

abstract class CreateCookState extends Equatable {
  const CreateCookState();
}

class CreateCookInitial extends CreateCookState {
  @override
  List<Object> get props => [];
}

class AddCookLoading extends CreateCookState {
  @override
  List<Object> get props => [];
}
class AddCookFailure extends CreateCookState {
  @override
  List<Object> get props => [];
}
class AddCookSuccess extends CreateCookState {
  @override
  List<Object> get props => [];
}