part of 'create_cook_bloc.dart';

abstract class CreateCookEvent extends Equatable {
  const CreateCookEvent();
}

class AddNewCookEvent extends CreateCookEvent{
  int id;
  String name;
  String description;
  double time;
  String imageUrl;

  AddNewCookEvent({
    required this.id,
    required this.name,
    required this.description,
    required this.time,
    required this.imageUrl,
  });

  @override
  List<Object?> get props =>[id,name,description,time,imageUrl];
}


