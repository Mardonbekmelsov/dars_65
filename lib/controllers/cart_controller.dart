import 'package:dars_65/models/cart_model.dart';
import 'package:dars_65/models/product_model.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  CartModel _cart = CartModel(
    products: {},
    totalPrice: 0,
  );

  CartModel get cart {
    return _cart;
  }

  void addToCart(ProductModel product) {
    if (_cart.products.containsKey(product.id)) {
      _cart.products[product.id]["amount"]++;
    } else {
      _cart.products[product.id] = {
        "product": product,
        "amount": 1,
      };
    }
    calculateTotal();
    notifyListeners();
  }

  void removeFromCart(String productId) {
    if (_cart.products.containsKey(productId)) {
      if (_cart.products[productId]["amount"] == 1) {
        _cart.products.removeWhere((key, value) {
          return key == productId;
        });
      } else {
        _cart.products[productId]["amount"]--;
      }
      calculateTotal();
      notifyListeners();
    }
  }

  void calculateTotal() {
    double total = 0;
    _cart.products.forEach((key, value) {
      total += value['product'].price * value['amount'];
    });
    _cart.totalPrice = total;
  }

  bool isInCart(String productId) {
    return _cart.products.containsKey(productId);
  }

  int getProductAmount(String productId) {
    return _cart.products[productId]['amount'];
  }

  void clearCart() {
    _cart = CartModel(products: {}, totalPrice: 0);
  }
}
