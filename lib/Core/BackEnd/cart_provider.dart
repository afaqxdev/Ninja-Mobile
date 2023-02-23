import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  double _tax = 0;
  double get tax => _tax;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  double _subTotalPrice = 0.0;
  double get subTotalPrice => _subTotalPrice;

  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setDouble('total_price', _totalPrice);
    prefs.setDouble('_subTotalPrice', _subTotalPrice);
    prefs.setDouble('tax', _tax);

    notifyListeners();
  }

  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_item') ?? 0;
    _totalPrice = prefs.getDouble('total_price') ?? 0.0;
    _subTotalPrice = prefs.getDouble('_subTotalPrice') ?? 0.0;
    _tax = prefs.getDouble('tax') ?? 0.0;

    notifyListeners();
  }

  void addTotalPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    _setPrefItems();
    notifyListeners();
  }

  void subTotal(double productPrice) {
    _subTotalPrice = _subTotalPrice + 1.96 + productPrice;
    _setPrefItems();
    notifyListeners();
  }

  void removeSubTotal(double productPrice) {
    _subTotalPrice = _subTotalPrice - 1.96 - productPrice;
    _setPrefItems();
    notifyListeners();
  }

  void addTaxes() {
    _tax = _tax + 1.96;
    _setPrefItems();
    notifyListeners();
  }

  void removeTaxes() {
    _tax = _tax - 1.96;
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPrefItems();
    return _totalPrice;
  }

  double getTaxes() {
    _getPrefItems();
    return _tax;
  }

  double getSubTotal() {
    _getPrefItems();
    return _subTotalPrice;
  }

  void addCounter() {
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  void removerCounter() {
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  int getCounter() {
    _getPrefItems();
    return _counter;
  }
}
