import 'package:flutter_zfcourier_crud_api/controller/parcel_controller.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';


class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(ParcelController());

  }
}
