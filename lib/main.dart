import 'package:Ninja/Core/BackEnd/cart_provider.dart';
import 'package:Ninja/Core/BackEnd/favorite.dart';
import 'package:Ninja/Core/Firebase/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'Core/BackEnd/loadBack.dart';
import 'Core/HiveDB/model.dart';
import 'Core/Routes/routes.dart';
import 'Core/Routes/routesName.dart';

void main() async {
  runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ModelHiveAdapter());
  await Hive.openBox<ModelHive>("Cart");
  await Hive.openBox<ModelHive>('favourite');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LoadBackEnd()),
          ChangeNotifierProvider(create: (context) => CartProvider()),
          ChangeNotifierProvider(create: (context) => FavoriteProvider()),
          ChangeNotifierProvider(create: (context) => Authcontroler()),
        ],
        child: ScreenUtilInit(
            builder: ((context, child) => GetMaterialApp(
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  initialRoute: RoutesName.SplashScreen,
                  onGenerateRoute: Routes.generateRoute,
                  // home: MyCart(),
                  debugShowCheckedModeBanner: false,
                ))));
  }
}
