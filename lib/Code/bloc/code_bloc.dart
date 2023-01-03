import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../SingUp/Utility.dart';

part 'code_event.dart';
part 'code_state.dart';

class CodeBloc extends Bloc<CodeEvent, CodeState> {
  CodeBloc() : super(CodeInitial()) {
    on<Getphone>((event, emit) async {
      //emit(PhoneState(phone: MySharedPreferences.instance.getStringValue("phone")));
      print(state);
    });
    on<Entercode>((event, emit) async {
      emit(Loading());

      String? be_code = MySharedPreferences.getcode();
      if (be_code == event.e_code) {
        emit(Okcode());
        print(state);
      } else {
        emit(Errorcode());
        print(state);
      }
    });
  }

  @override
  Stream<CodeState> mapEventToState(
    CodeEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
