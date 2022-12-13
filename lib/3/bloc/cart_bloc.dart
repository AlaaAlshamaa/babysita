import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../CartModel.dart';
import '../ItemModel.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddCart>((event, emit) async {
      emit(Loading());
      print(state);
      int x = await _buy(event.order);
      if (x == 200) {
        emit(Ok());
        print(state);
      } else
        emit(Error());
      print(state);
    });
  }

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

// Services

Future<int> _buy(Cart order) async {
  var response = await http.get(
      Uri.http('https://eva.webmyidea.com/api/v1', '/orders'),
      headers: order.getListMap(order.basketItems));

  dynamic _response = response.body.runtimeType;

  //return _response;

  return 200;
}
