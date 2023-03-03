import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckSignInandOut with ChangeNotifier {
  bool _checkSign = false;
  bool get checkSign => _checkSign;
  void _setPrefSign() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Check_Sign', _checkSign);
    notifyListeners();
  }

  void _getPrefSign() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _checkSign = prefs.getBool('Check_Sign') ?? false;
    notifyListeners();
  }

  void checkedSign(bool yourValue) {
    _checkSign = yourValue;
    _setPrefSign();
    notifyListeners();
  }

  bool getcheckedSign() {
    _getPrefSign();
    return _checkSign;
  }
}
