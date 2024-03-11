import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/parcel_controller.dart';

class ParcelCreateUpdatePage extends StatefulWidget {
  @override
  State<ParcelCreateUpdatePage> createState() => _ParcelCreateUpdatePageState();
}

class _ParcelCreateUpdatePageState extends State<ParcelCreateUpdatePage> {
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
            ? "Update Parcel"
            : "Create Parcel"))

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: parcelController.merchantOrderIdController,
                decoration: InputDecoration(labelText: "Merchant Order ID"),
              ),
              TextFormField(
                controller: parcelController.recipientNameController,
                decoration: InputDecoration(labelText: "Recipient Name"),
              ),
              TextFormField(
                controller: parcelController.recipientPhoneController,
                decoration: InputDecoration(labelText: "Recipient Phone"),
              ),
              TextFormField(
                controller: parcelController.recipientCityController,
                decoration: InputDecoration(labelText: "Recipient City"),
              ),
              TextFormField(
                controller: parcelController.recipientAreaController,
                decoration: InputDecoration(labelText: "Recipient Area"),
              ),
              TextFormField(
                controller: parcelController.recipientZoneController,
                decoration: InputDecoration(labelText: "Recipient Zone"),
              ),
              TextFormField(
                controller: parcelController.recipientAddressController,
                decoration: InputDecoration(labelText: "Recipient Address"),
              ),
              TextFormField(
                controller: parcelController.amountToCollectController,
                decoration: InputDecoration(labelText: "Amount To Collect"),
              ),
              TextFormField(
                controller: parcelController.stockPriceController,
                decoration: InputDecoration(labelText: "Stock Price"),
              ),
              TextFormField(
                controller: parcelController.itemDescriptionController,
                decoration: InputDecoration(labelText: "Item Description"),
              ),
              TextFormField(
                controller: parcelController.itemQuantityController,
                decoration: InputDecoration(labelText: "Item Quantity"),
              ),
              TextFormField(
                controller: parcelController.itemWeightController,
                decoration: InputDecoration(labelText: "Item Weight"),
              ),
              TextFormField(
                controller: parcelController.specialInstructionController,
                decoration: InputDecoration(labelText: "Special Instruction"),
              ),
              TextFormField(
                controller: parcelController.shopIdController,
                decoration: InputDecoration(labelText: "Shop ID"),
              ),
              ElevatedButton(
                onPressed: parcelController.updateParcel,
                child: Obx(() => Text(parcelController.isUpdateMode.value
                    ? "Update Parcel"
                    : "Create Parcel"))
              ),
            ],
          ),
        ),
      ),
    );
  }
}
