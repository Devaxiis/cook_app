part of 'read_cook_bloc.dart';

abstract class ReadCookState extends Equatable {
  const ReadCookState();
}

class ReadCookInitial extends ReadCookState {
  @override
  List<Object> get props => [];
}

class ReadCookSuccess extends ReadCookState {
  List<CookingModel> data;

  ReadCookSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class ReadCookFailure extends ReadCookState {

  @override
  List<Object> get props => [];
}
