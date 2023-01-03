part of 'code_bloc.dart';

@immutable
abstract class CodeEvent {}

class Getphone extends CodeEvent {}

class Entercode extends CodeEvent {
  String e_code;
  Entercode({
    required this.e_code,
  });
}
