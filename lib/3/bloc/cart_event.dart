part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class AddCart extends CartEvent {
  /* List<Item> items = [];
  double totalPrice = 0.0;
  AddCart({
    required this.items,
    required this.totalPrice,
  });
  */
  Cart order = Cart();
  AddCart({
    required this.order,
  });
}
