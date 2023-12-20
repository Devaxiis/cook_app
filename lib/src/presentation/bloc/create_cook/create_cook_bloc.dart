import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:retsept/src/core/service_loactor.dart';
import 'package:retsept/src/domain/model/cooking_model.dart';

part 'create_cook_event.dart';
part 'create_cook_state.dart';

class CreateCookBloc extends Bloc<CreateCookEvent, CreateCookState> {
  CreateCookBloc() : super(CreateCookInitial()) {
    on<AddNewCookEvent>(_addNewCook);
  }
  void _addNewCook(AddNewCookEvent event,Emitter emit)async{
    emit(AddCookLoading());


    final data =  CookingModel(
        id: event.id,
        name: event.name,
        description: event.description,
        time: event.time,
        imageUrl: event.imageUrl);

    final response = await repository.storeCooking(data);
    if(response){
      emit(AddCookSuccess());
    }else{
      emit(AddCookFailure());
    }

  }
}
