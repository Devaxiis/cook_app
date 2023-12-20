import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:retsept/src/domain/model/cooking_model.dart';

import '../../../core/service_loactor.dart';

part 'read_cook_event.dart';
part 'read_cook_state.dart';

class ReadCookBloc extends Bloc<ReadCookEvent, ReadCookState> {
  ReadCookBloc() : super(ReadCookInitial()) {
    on<ReadCook>(_readSuccess);
  }

  void _readSuccess(ReadCook event, Emitter emit)async{
    final respon = repository.readCooking();
    if(respon.isNotEmpty){
    emit(ReadCookSuccess(respon));
    }else{
      emit(ReadCookFailure());
    }
  }
}
