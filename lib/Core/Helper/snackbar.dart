import 'package:Ninja/Core/Helper/Color.dart';
import 'package:get/get.dart';

class CutomSnackbar {
  static snackBar(String message, String title) {
    Get.snackbar(title, message, backgroundColor: AppColor().buttonColor);
  }
}
