import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../controller/auth_controller.dart';
import '../../../styles/app_colors.dart';
import '../../../utils/constants.dart';
import '../../widgets/button_inside_loader.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool? _isConnected;

  Future<void> _checkInternetConnection() async {
    try {
      final response =
      await InternetAddress.lookup('www.google.com'); //kindacode
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

  final LoginController controller = Get.find();
  TextEditingController? idTextEditingController;
  TextEditingController? mobileTextEditingController;
  TextEditingController? passwordTextEditingController;

  var _passwordVisible = true;
  final _formKey = GlobalKey<FormState>();
  final storage = GetStorage();
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  void _showAlertDialogue(BuildContext context) {
    // set up the buttons
    Widget selfie = TextButton(
      child: const Text("Enable"),
      onPressed: () {
        // AppSettings.openDeviceSettings(
        //   asAnotherTask: true,
        // );
      },
    );
    Widget gallery = TextButton(
        child: const Text("Later"),
        onPressed: () {
          Navigator.pop(context);
          SystemNavigator.pop();
        });

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("No Internet!"),
      content: const Text("Please enable your internet connection!"),
      actions: [
        selfie,
        gallery,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  late bool _isSelected;

  @override
  void initState() {
    // TODO: implement initState
    // controller.checkVersion();
    /*if(storage.read('isUserRegistered') == 'Yes'){
      emailTextEditingController!.text = storage.read("userEmail");
      passwordTextEditingController = TextEditingController();
    }else{
      emailTextEditingController = TextEditingController();
      passwordTextEditingController = TextEditingController();
    }*/
    idTextEditingController = TextEditingController();
    mobileTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();

    idTextEditingController!.text = '01150432';
    mobileTextEditingController!.text = '01670702563';

    _isSelected = false;
    _checkInternetConnection();
    // _initPackageInfo();
    controller.process.value = false;
    controller.loading.value = false;

    super.initState();
  }

  @override
  void dispose() {
    // imageCache.clear();
    // imageCache.clearLiveImages();
    // Dispose of the controller when the widget is disposed.

    // controller.dispose();



    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body:Obx(()=> Form(
        key: _formKey,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/whitebg.png'),
                  fit: BoxFit.cover, // Adjust the fitting as needed
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 4/ 5,
                  decoration:  const BoxDecoration(
                    color: AppColors.appColor, // Change this to your desired background color
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          Constants.appName,textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2
                            // fontFamily:'assets/fonts/static/Urbanist.ttf'
                          ),
                        ),
                        SizedBox(height: 50,),
                        const Text(
                          'Login',textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2
                            // fontFamily:'assets/fonts/static/Urbanist.ttf'
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding:  const EdgeInsets.all(0.0),
                          child: SizedBox(
                            height: 55,
                            child: TextField(
                              // obscureText: _passwordVisible,
                              // controller: controller.idTextEditingController,
                              keyboardType: TextInputType.text,
                              controller: idTextEditingController,
                              style:  const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon:  const Icon(Icons.person,color: AppColors.appColor,),
                                suffixIcon: controller
                                    .nameTextEditingController!.text.isEmpty
                                    ?  const Text('')
                                    : GestureDetector(
                                  onTap: () {
                                    // controller.idTextEditingController!.clear();
                                    // controller.idTextEditingController!.clear();
                                    idTextEditingController!.clear();
                                    mobileTextEditingController!.clear();
                                  },
                                  child:  const Icon(Icons.close),
                                ),
                                hintText: Constants.userId,
                                // labelText: ants.userEmail,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 55,
                          child: Padding(
                            padding:  const EdgeInsets.all(1.0),
                            child: TextField(
                              // obscureText: _passwordVisible,
                              // controller: controller.idTextEditingController,
                              keyboardType: TextInputType.number,
                              controller: mobileTextEditingController,
                              style:  const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon:  const Icon(Icons.phone_android,color: AppColors.appColor,),
                                suffixIcon: controller
                                    .nameTextEditingController!.text.isEmpty
                                    ?  const Text('')
                                    : GestureDetector(
                                  onTap: () {
                                    // controller.idTextEditingController!.clear();
                                    // controller.idTextEditingController!.clear();
                                    mobileTextEditingController!.clear();
                                    mobileTextEditingController!.clear();
                                  },
                                  child:  const Icon(Icons.close),
                                ),
                                hintText: Constants.phoneNumber,
                                // labelText: ants.userEmail,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding:  const EdgeInsets.only(left: 60.0,right: 60,top: 20,bottom: 20),
                          child: CustomBtnInsideLoader(color: Colors.white,process: controller.process.value, loading: controller.loading.value, titleText: 'Sign In',textColor: AppColors.appColor,sizeTitle: 16, onPressed: () {
                            if (_isConnected == true) {
                              if (mobileTextEditingController!
                                  .text.isEmpty || idTextEditingController!
                                  .text.isEmpty ) {
                                ScaffoldMessenger.of(
                                    context)
                                    .showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Field can't be empty!",
                                        textAlign: TextAlign
                                            .center,
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight:
                                            FontWeight
                                                .bold),
                                      ),
                                      duration: Duration(
                                          seconds: 2),
                                      backgroundColor:
                                      AppColors
                                          .buttonColor,
                                    ));
                              } else {

                                print(idTextEditingController!.text);
                                print(mobileTextEditingController!.text);

                                controller.login(
                                    idTextEditingController!
                                        .text,
                                    mobileTextEditingController!
                                        .text);
                                // Get.back();
                                // Get.to(() =>  VerifyMobilePage(), transition: Transition.leftToRight,duration: Duration(milliseconds: 500));
                              }
                            } else {
                              _showAlertDialogue(
                                  context);
                            }
                          }),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 8,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 93,
                  height: 93,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 6,
                      child:   Image.asset(
                          Constants.assetImagePath+'aci_logo.png',
                      ), // Replace with your image asset
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
