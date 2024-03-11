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

import '../../../controller/auth_controller.dart';
import '../sign_in/sign_in_page.dart';



class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  final LoginController controller = Get.put(LoginController());

  bool? _isConnected;
  // This function is triggered when the floating button is pressed
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
  var _visible = true;
  bool?   loading ;
  String? UserID,todaysDate;
  AnimationController? animationController;
  Animation<double>? animation;
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
    // Get.back();
    // Navigator.pop(context);

  }
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );


  void navigationPage() {
    // detectUser();
    if(_isConnected == true){

      // Get.back();
    /*  Get.to(() =>  const MobileEntryPage(),
          transition: Transition.leftToRight,
          duration: const Duration(milliseconds: 500));*/

      Get.to(() =>  const SignInPage(),
          transition: Transition.leftToRight,
          duration: const Duration(milliseconds: 500));


      // _initPackageInfo();
      // detectUser();
     /* if(storage.read("userRememberWhileLogin")=='Yes'){
        Get.back();
        // Get.to(() =>  const MobileEntryPage(),
        //     transition: Transition.leftToRight,
        //     duration: const Duration(milliseconds: 500));


        Get.to(() => TestScreen(),
            transition: Transition.leftToRight,
            duration:
            Duration(milliseconds: 500));
      }else{
        Get.back();
        // Get.back();
        Get.to(() =>  const MobileEntryPage(),
            transition: Transition.leftToRight,
            duration: const Duration(milliseconds: 500));

      }*/




    }else{
      // showInSnackBar("Please enable your internet connection!");
      // _showAlertDialogue(context);
      /*showDialog(
        barrierColor: Colors.black26,
        context: context,
        builder: (context) {
          return  CustomAlertDialog(
            title: "No Internet !",
            description: "Please enable your internet connection",  posText: 'Enable',negText: 'Later',
            positiveBtn: () {
              AppSettings.openDeviceSettings(
                asAnotherTask: true,
              );
            },
            negetiveBtn: () {
              Navigator.pop(context);
              SystemNavigator.pop();
            },
          );
        },
      );*/

    }

  }



  @override
  void initState() {
    super.initState();

    _checkInternetConnection();

    setState(() {
      _visible = !_visible;
    });

    startTime();

  }

  @override
  void dispose() {
    controller.dispose();
    // _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
/*    return Scaffold(
      // backgroundColor: AppColors.appColor,
      backgroundColor: AppColors.appColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
                Constants.assetImagePath+'aci_logo.png',
                width: 100,
                height: 100,
                fit:BoxFit.fill
            ),
            const SizedBox(height: 30,),
            const Text(
              Constants.appName,
              maxLines: 2,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2
                // color: AppColors.appColor
              ),
            )
          ],
        ),
      ),
    );*/
    return  Container(
      constraints: BoxConstraints(
        maxWidth: Get.width,  // Set your maximum width here
        maxHeight: Get.height, // Set your maximum height here
      ),
      child: Image.asset(
        'assets/images/Spash-screen.png',
        fit: BoxFit.fill, // or any other fit value as per your requirement
      ),
    );
  }
}
