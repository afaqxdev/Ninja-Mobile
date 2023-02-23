import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider with ChangeNotifier {
  List<String> _image = [];
  List<String> get img => _image;
  List<String> _price = [];
  List<String> get favprice => _price;
  List<String> _name = [];
  List<String> get favname => _name;
  List<String> _empimg = ["no data"];

  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList("img", _image);
    prefs.setStringList("favprice", _name);
    prefs.setStringList("favname", _price);
    notifyListeners();
  }

  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _image = prefs.getStringList('img') ?? _empimg;
    _name = prefs.getStringList('favname') ?? _empimg;
    _name = prefs.getStringList('favprice') ?? _empimg;
    notifyListeners();
  }

  void addimage(String img) {
    _image.add(img);
    _setPrefItems();
    notifyListeners();
  }

  void addfavprice(String price) {
    _price.add(price);
    _setPrefItems();
    notifyListeners();
  }

  void addname(String name) {
    _name.add(name);
    _setPrefItems();
    notifyListeners();
  }

  void removeimage(String img) {
    _image.remove(img);
    _setPrefItems();
    notifyListeners();
  }

  void removefavprice(String price) {
    _price.remove(price);
    _setPrefItems();
    notifyListeners();
  }

  void removefavname(String name) {
    _name.remove(name);
    _setPrefItems();
    notifyListeners();
  }

  List<String> getimage() {
    _getPrefItems();
    return _image;
  }

  List<String> getfavprice() {
    _getPrefItems();
    return _price;
  }

  List<String> getfavname() {
    _getPrefItems();
    return _name;
  }
}
