import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:testgit/3/ItemModel.dart';

class Cart extends ChangeNotifier {
  List<Item> _items = [];
  double _totalPrice = 0.0;

  void add(Item item) {
    if (_items.contains(item)) {
      item.quantity++;
    } else {
      _items.add(item);
    }
    _totalPrice += item.price;
    notifyListeners();
  }

  void remove(Item item) {
    _totalPrice -= item.price;
    _items.remove(item);
    notifyListeners();
  }

  void minimize(Item item) {
    _totalPrice -= item.price;
    item.quantity--;
    if (item.quantity == 0) remove(item);
    notifyListeners();
  }

  void addone(Item item) {
    _totalPrice += item.price;
    item.quantity++;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  List<Item> get basketItems {
    return _items;
  }

// this helper method helps convert to a list of Map
  dynamic getListMap(List<Item> items) {
    if (items == null) {
      return null;
    }
    List<Map<String, dynamic>> cartItems = [];
    items.forEach((element) {
      cartItems.add(element.toMap());
    });
    return cartItems;
  }
}
