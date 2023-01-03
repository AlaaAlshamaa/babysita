part of 'code_bloc.dart';

@immutable
abstract class CodeState {}

class CodeInitial extends CodeState {}

//class PhoneState extends CodeState {
//  String phone;

// PhoneState({required this.phone});

class Entercodes extends CodeState {}

class Loading extends CodeState {}

class Okcode extends CodeState {}

class Errorcode extends CodeState {}
