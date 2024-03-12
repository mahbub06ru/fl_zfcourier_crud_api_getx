import 'package:flutter/material.dart';
import 'package:flutter_zfcourier_crud_api/styles/app_colors.dart';
import 'package:get/get.dart';

import '../../controller/parcel_controller.dart';

class CreateUpdatePage extends StatefulWidget {
  @override
  State<CreateUpdatePage> createState() => _CreateUpdatePageState();
}

class _CreateUpdatePageState extends State<CreateUpdatePage> {
  final ParcelController parcelController = Get.find();

  @override
  void initState() {
    if(parcelController.isUpdateMode.value){

    }else{

    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(parcelController.isUpdateMode.value
            ? "Parcel Details"
            : "Create Parcel"))

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: parcelController.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: parcelController.merchantOrderIdController,
                  decoration: const InputDecoration(labelText: "Merchant Order ID"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Merchant Order ID';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: parcelController.recipientNameController,
                  decoration: const InputDecoration(labelText: "Recipient Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Recipient Name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: parcelController.recipientPhoneController,
                  decoration: const InputDecoration(labelText: "Recipient Phone"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Recipient Phone';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: parcelController.recipientCityController,
                  decoration: const InputDecoration(labelText: "Recipient City"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Recipient City';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: parcelController.recipientAreaController,
                  decoration: const InputDecoration(labelText: "Recipient Area"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Recipient Area';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: parcelController.recipientZoneController,
                  decoration: const InputDecoration(labelText: "Recipient Zone"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Recipient Zone';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: parcelController.recipientAddressController,
                  decoration: const InputDecoration(labelText: "Recipient Address"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Recipient Address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: parcelController.amountToCollectController,
                  decoration: const InputDecoration(labelText: "Amount To Collect"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Amount To Collect';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: parcelController.stockPriceController,
                  decoration: const InputDecoration(labelText: "Stock Price"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Stock Price';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: parcelController.itemDescriptionController,
                  decoration: const InputDecoration(labelText: "Item Description"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Item Description';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: parcelController.itemQuantityController,
                  decoration: const InputDecoration(labelText: "Item Quantity"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Item Quantity';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: parcelController.itemWeightController,
                  decoration: const InputDecoration(labelText: "Item Weight"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Item Weight';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: parcelController.specialInstructionController,
                  decoration: const InputDecoration(labelText: "Special Instruction"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Special Instruction';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: parcelController.shopIdController,
                  decoration: const InputDecoration(labelText: "Shop ID"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Shop ID';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    if (parcelController.formKey.currentState?.validate() ?? false) {
                      // Validation passed, call your updateParcel or createParcel method
                      parcelController.isUpdateMode.value
                          ? parcelController.updateParcel()
                          : parcelController.createParcel();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.appColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Obx(
                        () => Text(
                      parcelController.isUpdateMode.value ? "Update Parcel" : "Create Parcel",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
