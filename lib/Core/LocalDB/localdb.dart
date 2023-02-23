import 'package:shared_preferences/shared_preferences.dart';

class localdatabase {
  String user_id = "userid";
  setuserData({String? userid, String? email}) async {
    SharedPreferences _shper = await SharedPreferences.getInstance();
    _shper.setString(user_id, userid!);
    _shper.setString('email', email!);
  }

  getuserData() async {
    SharedPreferences _shper = await SharedPreferences.getInstance();
    return _shper.getString(user_id).toString();
  }
}
