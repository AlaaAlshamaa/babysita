part of 'singup_bloc.dart';

@immutable
abstract class SingupState {}

class SingupInitial extends SingupState {}

class AddDatas extends SingupState {}

class Loading extends SingupState {}

class Ok extends SingupState {}

class Error extends SingupState {}

class OldUser extends SingupState {}
