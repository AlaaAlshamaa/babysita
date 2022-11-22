part of 'singup_bloc.dart';

@immutable
abstract class SingupEvent {}

class Printdata extends SingupEvent {
  String uname = "0";
  String phone = "0";
  String pw1 = "0";
  String pw2 = "0";
  Printdata(
      {required this.uname,
      required this.phone,
      required this.pw1,
      required this.pw2});
}

class AddData extends SingupEvent {
  String uname = "0";
  String phone = "0";
  String pw1 = "0";
  String pw2 = "0";
  AddData({
    required this.uname,
    required this.phone,
    required this.pw1,
    required this.pw2,
  });
}
