import 'dart:async';
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../controller/auth_controller.dart';
import '../widgets/custom_alert_dialog.dart';
import 'sign_in_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final LoginController controller = Get.put(LoginController());

  bool? _isConnected;
  Future<void> _checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');//kindacode
      print(response);
      if (response.isNotEmpty) {
        setState(() {
          _isConnected = true;

        });
      }
    } on SocketException catch (err) {
      setState(() {
        _isConnected = false;
      });
      if (kDebugMode) {
        print(err);
      }
    }
  }

  final storage = GetStorage();
  bool?   loading ;
  String? UserID,todaysDate;
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }
  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(value,
          textAlign: TextAlign.center, style: const TextStyle(fontSize: 16.0, fontWeight:
          FontWeight.bold),), duration: const Duration(seconds: 2), backgroundColor: Colors.blueAccent,)
    );

  }

  void navigationPage() {
    if(_isConnected == true){

      Get.to(() =>  const SignInPage(),
          transition: Transition.leftToRight,
          duration: const Duration(milliseconds: 500));
    }else{
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        builder: (context) {
          return  CustomAlertDialog(
            title: "No Internet !",
            description: "Please enable your internet connection",  posText: 'Enable',negText: 'Later',
            positiveBtn: () {
              // AppSettings.openDeviceSettings(
              //   asAnotherTask: true,
              // );
            },
            negetiveBtn: () {
              Navigator.pop(context);
              SystemNavigator.pop();
            },
          );
        },
      );

    }

  }

  @override
  void initState() {
    super.initState();

    _checkInternetConnection();

    startTime();

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      constraints: BoxConstraints(
        maxWidth: Get.width,
        maxHeight: Get.height,
      ),
      child: Image.asset(
        'assets/images/splash.png',
        fit: BoxFit.fill,
      ),
    );
  }
}
