import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:babysita/SingUp/Utility.dart';

import '../SingUpModel.dart';

part 'singup_event.dart';
part 'singup_state.dart';

class SingupBloc extends Bloc<SingupEvent, SingupState> {
  SingupBloc() : super(SingupInitial()) {
    on<Printdata>((event, emit) async {
      emit(Loading());
      print("  ${event.uname} - ${event.phone} - ${event.pw1} - ${event.pw2}");
    });

    on<AddData>((event, emit) async {
      emit(Loading());
      print(state);
      bool x = await _singup(event.uname, event.phone, event.pw1, event.pw2);
      if (x) {
        emit(Ok());
        print(state);
      } else
        emit(Error());
      print(state);
    });

    @override
    Stream<SingupState> mapEventToState(
      SingupEvent event,
    ) async* {
      // TODO: implement mapEventToState
    }
  }
}
// Services

Future<bool> _singup(String name, String phone_number, String password,
    String password_confirmation) async {
  SingUp_data request = SingUp_data(
    name: name,
    phone_number: phone_number,
    password: password,
    password_confirmation: password_confirmation,
  );

  try {
    final token = <String, String>{
      'fcm_token':
          'cY4ODc3dWSQ:APA91bGwqKD2Nsi63zttB7HomHDXyPRuId0CMcCx0UZR0ciYBfiE1LCj3v3eTCIdqzsVWu_iGvBmvnsqXDN-NB4F4jZwEZGooZ4fVlP3sYecYD-R4mNm1wt6I7yZ1sqaCHUpCK-0y3PH'
    };
    request.toMap().addEntries(token.entries);
    var dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
    final response = await dio.post(
      'https://eva.webmyidea.com/api/v1/register',
      queryParameters: request.toMap(),
      data: {
        name: name,
        phone_number: phone_number,
        password: password,
        password_confirmation: password_confirmation,
      },
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 400;
          }),
    );

    print("oooooooooooooook");
    print(response.data);
    return true;
  } catch (e) {
    // TODO

    print("!!!!!!!!!!!!!!!");
    print(e);
    return false;
  }
}
