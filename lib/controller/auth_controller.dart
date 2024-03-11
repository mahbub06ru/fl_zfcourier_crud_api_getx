import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../network/request.dart';
import '../utils/constants.dart';
import '../views/screens/home/home_page.dart';

class LoginController extends GetxController {
  RxBool loading = false.obs;
  RxBool loadingProf = false.obs;
  late Map<String, dynamic> responseJson;

  RxMap userData = {}.obs;
  RxString? userToken = ''.obs;
  void showLoader() async {
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.custom,
    );
  }

  var process = false.obs;
  var processProf = false.obs;
  var userEmailWhileRegistration = false.obs;
  var userRememberWhileLogin = false.obs;

  var error = "";
  var mobileNo = ''.obs;
  var otp = ''.obs;
  // var otp = ''.obs;
  var otpForResetPW='';

  var selectedRBItemOne = 0.obs;
  onChangeItemOne(var item) {
    selectedRBItemOne.value = item;

    print("controller" + selectedRBItemOne.value.toString());
  }

  TextEditingController? nameTextEditingController;
  TextEditingController? passwordTextEditingController ;
  String? userName;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    nameTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();

    // checkVersion();
  }

  void login(String id, String mobile) async {
    process(false);
    loading(true);
    Request request = Request(url: 'auth/login', body: {
      // "user_code": idTextEditingController!.text,
      "phone": '8801627561556',
      // "password": passwordTextEditingController!.text,
      "password": '123456',

    });
    print(request.toString());
    request.post().then((response) {
      print(response.body.toString());
      print('statusCode' + response.statusCode.toString());
      if (response.statusCode == 200) {
        var responseJson = jsonDecode(response.body);
        print(responseJson);

        userData.value = responseJson['user'];
        userToken!.value = responseJson['token'];

        process(false);
        loading(false);

        Get.back();
        Get.to(() =>  const HomePage(), transition: Transition.leftToRight,duration: const Duration(milliseconds: 500));

      }
      else {
        process(false);
        loading(false);

        Fluttertoast.showToast(
            msg: 'Server error! please try again.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blueAccent,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }).catchError((onError) {
      process(false);
      loading(false);

      Fluttertoast.showToast(
          msg: onError.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueAccent,
          textColor: Colors.white,
          fontSize: 16.0
      );
      print(onError);
      printError();
    });
  }



  @override
  void onClose() {
    nameTextEditingController?.dispose();
    passwordTextEditingController?.dispose();
    super.onClose();
  }

 void sendEmailForResetPW(String email, String otpForResetPW) {
    Fluttertoast.showToast(
        msg: 'Your password reset OTP: $otpForResetPW',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueAccent,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  void sendEmailForVerifyUser(String email, String otpForResetPW) {
    Fluttertoast.showToast(
        msg: 'Your verification OTP: $otpForResetPW',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueAccent,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }




}