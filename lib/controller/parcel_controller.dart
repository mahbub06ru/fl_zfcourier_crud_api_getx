import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../models/parcel/list.dart';
import '../models/parcel/update.dart';
import '../utils/constants.dart';
import 'auth_controller.dart';

class ParcelController extends GetxController {
  /*var accountInfo = AccountInfo().obs;
  RxList<OpenTraderList> openTrades = <OpenTraderList>[].obs;*/
  RxDouble totalProfit = 0.0.obs;
  final LoginController loginController = Get.find();

  void showLoader() async {
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.custom,
    );
  }

  RxList<Parcel> contentList = <Parcel>[].obs;
  RxInt totalElements = 0.obs;
  RxInt page = 1.obs;
  RxInt size = 10.obs;
  Rx<ParcelSummary> summary = ParcelSummary().obs;

  void showADialog(String title, String des) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(des),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Dismiss the dialog
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }


  var isUpdateMode = false.obs;


  final TextEditingController merchantOrderIdController =TextEditingController();
  final TextEditingController recipientNameController =TextEditingController();
  final TextEditingController recipientPhoneController =TextEditingController();
  final TextEditingController recipientCityController =TextEditingController();
  final TextEditingController recipientAreaController =TextEditingController();
  final TextEditingController recipientZoneController =TextEditingController();
  final TextEditingController recipientAddressController =TextEditingController();
  final TextEditingController amountToCollectController =TextEditingController();
  final TextEditingController stockPriceController = TextEditingController();
  final TextEditingController itemDescriptionController =TextEditingController();
  final TextEditingController itemQuantityController =TextEditingController();
  final TextEditingController itemWeightController = TextEditingController();
  final TextEditingController specialInstructionController =TextEditingController();
  final TextEditingController shopIdController = TextEditingController();

  void showASuccessDialog(String title, String des) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(des),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Dismiss the dialog
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  RxBool isLoading = false.obs;
  RxBool loading = false.obs;
  RxString customerCode = ''.obs;

  final storage = GetStorage();
  var token = '';
  var lastFourDigits = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    // getAccountInformation();
  }
  void resetFormFields() {
    // Reset all form fields here
    merchantOrderIdController.clear();
    recipientNameController.clear();
    recipientPhoneController.clear();
    recipientCityController.clear();
    recipientAreaController.clear();
    recipientZoneController.clear();
    recipientAddressController.clear();
    amountToCollectController.clear();
    stockPriceController.clear();
    itemDescriptionController.clear();
    itemQuantityController.clear();
    itemWeightController.clear();
    specialInstructionController.clear();
    shopIdController.clear();

    update();
  }

  @override
  void dispose() {
    merchantOrderIdController.dispose();
    recipientNameController.dispose();
    recipientPhoneController.dispose();
    recipientCityController.dispose();
    recipientAreaController.dispose();
    recipientZoneController.dispose();
    recipientAddressController.dispose();
    amountToCollectController.dispose();
    stockPriceController.dispose();
    itemDescriptionController.dispose();
    itemQuantityController.dispose();
    itemWeightController.dispose();
    specialInstructionController.dispose();
    shopIdController.dispose();

    super.dispose();
  }


  Future<void> fetchParcels() async {
    showLoader();
    print(loginController.userToken!.value);
    final apiUrl =
        "https://demo.zfcourier.xyz/api/v/1.0.0/parcels?page=${page.value}&shopId=shop-123";
    final authToken = loginController.userToken!.value;

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {"x-auth-token": authToken},
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        final parcelListModel = ParcelListModel.fromJson(result);

        contentList.assignAll(parcelListModel.content ?? []);
        totalElements.value = parcelListModel.totalElements ?? 0;
        page.value = parcelListModel.page ?? 1;
        size.value = parcelListModel.size ?? 10;
        summary.value = parcelListModel.summary!;

        update(); // Update UI with new data
        EasyLoading.dismiss();
      } else {
        // Handle server error
        print("Server error: ${response.statusCode}");
        EasyLoading.dismiss();
      }
    } catch (e) {
      // Handle network error or other exceptions
      EasyLoading.dismiss();
      print("Error: $e");
    }
  }
  Future<void> fetchParcelById(String? id) async {
    print(loginController.userToken!.value);
    final apiUrl =
        "https://demo.zfcourier.xyz/api/v/1.0.0/parcels/id/$id";
    final authToken = loginController.userToken!.value;

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {"x-auth-token": authToken},
      );

      if (response.statusCode == 200) {
        final result = ParcelUpdate.fromJson(json.decode(response.body));

        merchantOrderIdController.text = result.merchantOrderId ?? '';
        recipientNameController.text = result.recipientName ?? '';
        recipientPhoneController.text = result.recipientPhone ?? '';
        recipientCityController.text = result.recipientCity ?? '';
        recipientAreaController.text = result.recipientArea ?? '';
        recipientZoneController.text = result.recipientZone ?? '';
        recipientAddressController.text = result.recipientAddress ?? '';
        amountToCollectController.text = result.amountToCollect?.toString() ?? '';
        stockPriceController.text = result.stockPrice?.toString() ?? '';
        itemDescriptionController.text = result.itemDescription ?? '';
        itemQuantityController.text = result.itemQuantity?.toString() ?? '';
        itemWeightController.text = result.itemWeight?.toString() ?? '';
        specialInstructionController.text = result.specialInstruction ?? '';
        shopIdController.text = result.shopId ?? '';

        // Set update mode
        isUpdateMode.value = true;
        update();
      } else {
        // Handle server error
        print("Server error: ${response.statusCode}");
        EasyLoading.dismiss();
      }
    } catch (e) {
      // Handle network error or other exceptions
      EasyLoading.dismiss();
      print("Error: $e");
    }
  }

  Future<void> fetchParcelsBySearch({String? searchParam}) async {
    showLoader();
    print(searchParam);
    const baseUrl = "https://demo.zfcourier.xyz/api/v/1.0.0/parcels";
    final authToken = loginController.userToken!.value;

    final queryParameters = {
      'invoice': 'zf0609234d',
      'recipientName': 'john dao',
      'recipientPhone': '',
      'page': '1',
      'shopId': 'shop-123',
    };

    // Check if searchParam is provided and add it to the queryParameters
    if (searchParam != null) {
      queryParameters['searchParam'] = searchParam;
    }

    try {
      final uri = Uri.parse(baseUrl).replace(queryParameters: queryParameters);

      final response = await http.get(
        uri,
        headers: {"x-auth-token": authToken},
      );
      print('statusCodeSearch');
      print(response.statusCode);

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        final parcelListModel = ParcelListModel.fromJson(result);

        contentList.assignAll(parcelListModel.content ?? []);
        print(contentList.length);
        totalElements.value = parcelListModel.totalElements ?? 0;
        page.value = parcelListModel.page ?? 1;
        size.value = parcelListModel.size ?? 10;
        summary.value = parcelListModel.summary!;

        update(); // Update UI with new data
        EasyLoading.dismiss();
      } else {
        // Handle server error
        EasyLoading.dismiss();
        print("Server error: ${response.statusCode}");
      }
    } catch (e) {
      // Handle network error or other exceptions
      EasyLoading.dismiss();
      print("Error: $e");
    }
  }

  Future<void> createParcel() async {
    const baseUrl = "https://demo.zfcourier.xyz/api/v/1.0.0/parcels/create";
    final authToken = loginController.userToken!.value;
    var amountToCollect = int.parse(amountToCollectController.text.trim());
    print('amountToCollect');
    print(amountToCollect);
    var stockPrice = int.parse(stockPriceController.text.trim());
    var itemQuantity = int.parse(itemQuantityController.text.trim());
    var itemWeight = int.parse(itemWeightController.text.trim());

    final parcelData = {
      "merchantOrderId": merchantOrderIdController.text,
      "recipientName": recipientNameController.text,
      "recipientPhone": recipientPhoneController.text,
      "recipientCity": recipientCityController.text,
      "recipientArea": recipientAreaController.text,
      "recipientZone": recipientZoneController.text,
      "recipientAddress": recipientAddressController.text,
      "amountToCollect": amountToCollect,
      "stockPrice": stockPrice,
      "itemDescription": itemDescriptionController.text,
      "itemQuantity": itemQuantity,
      "itemWeight": itemWeight,
      "specialInstruction": specialInstructionController.text,
      "shopId": shopIdController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          "Content-Type": "application/json",
          "x-auth-token": authToken,
        },
        body: jsonEncode(parcelData),
      );

      print('statusCodeCreate');
      print( jsonEncode(parcelData));
      print(response.statusCode);

      if (response.statusCode == 200) {
        showASuccessDialog('Success!','Parcel has been created successfully.');
      } else {
        showASuccessDialog('Oops!','Server error.');
        // Handle server error
        print("Server error: ${response.statusCode}");
        // You can show an error message to the user
      }
    } catch (e) {
      showASuccessDialog('Oops!',e.toString());
      print("Error: $e");
      // You can show an error message to the user
    }
  }
  Future<void> updateParcel() async {
    const baseUrl = "https://demo.zfcourier.xyz/api/v/1.0.0/parcels/create";
    final authToken = loginController.userToken!.value;
    var amountToCollect = int.parse(amountToCollectController.text.trim());
    print('amountToCollect');
    print(amountToCollect);
    var stockPrice = int.parse(stockPriceController.text.trim());
    var itemQuantity = int.parse(itemQuantityController.text.trim());
    var itemWeight = int.parse(itemWeightController.text.trim());

    final parcelData = {
      "merchantOrderId": merchantOrderIdController.text,
      "recipientName": recipientNameController.text,
      "recipientPhone": recipientPhoneController.text,
      "recipientCity": recipientCityController.text,
      "recipientArea": recipientAreaController.text,
      "recipientZone": recipientZoneController.text,
      "recipientAddress": recipientAddressController.text,
      "amountToCollect": amountToCollect,
      "stockPrice": stockPrice,
      "itemDescription": itemDescriptionController.text,
      "itemQuantity": itemQuantity,
      "itemWeight": itemWeight,
      "specialInstruction": specialInstructionController.text,
      "shopId": shopIdController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          "Content-Type": "application/json",
          "x-auth-token": authToken,
        },
        body: jsonEncode(parcelData),
      );

      print('statusCodeCreate');
      print( jsonEncode(parcelData));
      print(response.statusCode);

      if (response.statusCode == 200) {
        showASuccessDialog('Success!','Parcel has been updated successfully.');
      } else {
        showASuccessDialog('Oops!','Server error.');
        // Handle server error
        print("Server error: ${response.statusCode}");
        // You can show an error message to the user
      }
    } catch (e) {
      showASuccessDialog('Oops!',e.toString());
      print("Error: $e");
      // You can show an error message to the user
    }
  }
}



