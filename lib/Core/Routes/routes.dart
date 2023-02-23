import 'package:Ninja/Core/Routes/routesName.dart';
import 'package:Ninja/Feature/MyCart/my_cart.dart';
import 'package:Ninja/Feature/PaymentScr/paymentscr.dart';
import 'package:Ninja/Feature/Profile/profile.dart';
import 'package:flutter/material.dart';

import '../../Feature/BottomNAv/bottomNav.dart';
import '../../Feature/Landing_Screen/Landing.dart';
import '../../Feature/Landing_Screen/appleScreen.dart';
import '../../Feature/Landing_Screen/load.dart';
import '../../Feature/Landing_Screen/miScreen.dart';
import '../../Feature/Landing_Screen/samsung.dart';
import '../../Feature/MainScreen/MianScreen.dart';
import '../../Feature/MainScreen/mobDetail.dart';
import '../../Feature/Sign/Recovery.dart';
import '../../Feature/Sign/Sign_In.dart';
import '../../Feature/Sign/Sign_Up.dart';
import '../../Feature/Splash_Screen/Splash_Screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.SplashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());

      case RoutesName.loadd:
        return MaterialPageRoute(builder: (context) => loadd());

      case RoutesName.MobDetail:
        return MaterialPageRoute(
            builder: (context) => MobDetail(
                  data: settings.arguments as Map,
                ));
      case RoutesName.BottomNav:
        return MaterialPageRoute(builder: (context) => BottomNav());
      case RoutesName.PaymentScr:
        return MaterialPageRoute(
            builder: (context) => PaymentScreen(
                  total: settings.arguments as Map,
                ));
      case RoutesName.Landing1:
        return MaterialPageRoute(builder: (context) => LandingScreen());

      case RoutesName.Landing2:
        return MaterialPageRoute(builder: (context) => AppleScreen());

      case RoutesName.Landing3:
        return MaterialPageRoute(builder: (context) => SamsungScreen());
      case RoutesName.Profile:
        return MaterialPageRoute(builder: (context) => Profile());
      case RoutesName.Landing4:
        return MaterialPageRoute(builder: (context) => MiScreen());
      case RoutesName.mycart:
        return MaterialPageRoute(builder: (context) => MyCart());

      case RoutesName.SignUP:
        return MaterialPageRoute(builder: (context) => SignUp());

      case RoutesName.SingIN:
        return MaterialPageRoute(builder: (context) => SignIn());

      case RoutesName.Forgot:
        return MaterialPageRoute(builder: (context) => Recovery());
      case RoutesName.MainScreen:
        return MaterialPageRoute(builder: (context) => MainScreen());

      default:
        return MaterialPageRoute(
            builder: (context) =>
                const Scaffold(body: Center(child: Text("nodata"))));
    }
  }
}
