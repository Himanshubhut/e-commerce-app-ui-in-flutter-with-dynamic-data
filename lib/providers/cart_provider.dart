import 'package:flutter/material.dart';
import 'package:nyntra/models/products.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<product> _cart = [];
  List<product> get cart => _cart;

  void toggleProduct(product Products) {
    if (_cart.contains(Products)) {
      for (product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(Products);
    }
    notifyListeners();
  }

  incrementQuantity(int index) => _cart[index].quantity++;
  decremenetQuantity(int index) => _cart[index].quantity--;

  getTotalprice() {
    double total = 0.0;
    for (product element in _cart) {
      total += element.price * element.quantity;
    }
    return total;
  }

  static CartProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
