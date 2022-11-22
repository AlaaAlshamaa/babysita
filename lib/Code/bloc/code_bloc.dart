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
  }

  @override
  Stream<CodeState> mapEventToState(
    CodeEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
