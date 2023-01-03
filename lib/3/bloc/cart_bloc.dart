import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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
      print(event.order);
      bool x = await _buy(event.order);
      if (x) {
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

Future<bool> _buy(Cart order) async {
  try {
    var dio = Dio();

    print((order.basketItems));
    print(order.getListMap(order.basketItems));
    print(order.getMapListMap(order.basketItems));

    Map<String, dynamic> _bask = {
      "basket": [order.getListMap(order.basketItems)]
    };

    print("---");
    print(_bask);

    final response = await dio.get(('http://192.168.43.123:3000/api/order'),
        queryParameters: _bask);

    //dynamic _response = response.data.runtimeType;
    print(response.data);
    print(response.runtimeType);

    print("oooooooooooooook");
    return true;
  } catch (e) {
    // TODO

    print("!!!!!!!!!!!!!!!");
    print(e);
    return false;
  }
}
