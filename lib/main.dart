
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_zfcourier_crud_api/styles/app_colors.dart';
import 'package:flutter_zfcourier_crud_api/utils/app_binding.dart';
import 'package:flutter_zfcourier_crud_api/views/screens/intro/splash_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'animation/custom_animation.dart';
import 'utils/constants.dart';
import 'views/screens/home/home_page.dart';
import 'views/screens/parcel_ceate_update_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.wave
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.black
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.green
    ..textColor = Colors.green
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = true
    ..customAnimation = CustomAnimation()
  ;
}
Future<void> main() async {

  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp( const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: AppColors.canvasColor,
        fontFamily: 'Urbanist',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge:  TextStyle(
              fontSize: Utils.responsiveFontSize(20, context),
              fontFamily: 'Urbanist',
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyMedium:  TextStyle(
              fontSize:Utils.responsiveFontSize(18, context),
              fontFamily: 'Urbanist',
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodySmall:  TextStyle(
              fontSize: Utils.responsiveFontSize(16, context),
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.bold,
            ),
        ),
      ),
      getPages: AppPages.getKey,
      initialBinding: AppBinding(),
      initialRoute: '/splashPage',
      // initialRoute: '/ImStepperPage',
    );
  }
}

class AppPages {
  static final getKey = [

    GetPage(
      name: '/splashPage',
      page: () =>  const SplashPage(),
    ),
    GetPage(
      name: '/HomePage',
      page: () =>  const HomePage(),
    ),
    GetPage(
      name: '/ParcelCreateUpdatePage',
      page: () =>   ParcelCreateUpdatePage(),
    ),



  ];
}