part of 'code_bloc.dart';

@immutable
abstract class CodeState {}

class CodeInitial extends CodeState {}

class PhoneState extends CodeState {
  Future<String>? phone;

  PhoneState({required this.phone});
}
