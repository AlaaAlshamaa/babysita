part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class Loading extends CartState {}

class Ok extends CartState {}

class Error extends CartState {}
