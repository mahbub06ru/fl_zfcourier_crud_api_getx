import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_zfcourier_crud_api/controller/parcel_controller.dart';
import 'package:flutter_zfcourier_crud_api/models/parcel/list.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/auth_controller.dart';
import '../../styles/app_colors.dart';
import '../../utils/constants.dart';
import '../widgets/list_tile.dart';
import '../widgets/seach_widget_repo.dart';
import '../widgets/skeleton_card.dart';
import 'ceate_update_screen.dart';
import 'search_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ParcelController parcelController = Get.find();
  final LoginController loginController = Get.find();
  final storage = GetStorage();

  void _showProductModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /*  Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: const BoxDecoration(
                color: AppColors.appColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Profile',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Obx(() => _homeController.isLoading.value
                  ? ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: const SkeletonCard());
                      },
                    )
                  : ListView(
                   children: [
                     Column(

                       children: [
                         Card(
                           child: ListTile(
                             title: const Text('Name'),
                             subtitle: Text(_homeController.accountInfo.value.name.toString()),
                           ),
                         ),
                         Card(
                           child: ListTile(
                             title: const Text('Address'),
                             subtitle: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text('${_homeController.accountInfo.value.address}'),
                                 Text('City: ${_homeController.accountInfo.value.city}'),
                                 Text('Zip Code: ${_homeController.accountInfo.value.zipCode}'),
                               ],
                             ),
                           ),
                         ),
                         Card(
                           child: ListTile(
                             title: const Text('Balance'),
                             subtitle: Text(Utils.formatDoubleToTwoDecimalPlaces(_homeController.accountInfo.value.balance!)),
                           ),
                         ),
                         Card(
                           child: ListTile(
                             title: const Text('Current Trades Count'),
                             subtitle: Text(Utils.formatDoubleToTwoDecimalPlaces(_homeController.accountInfo.value.currentTradesCount)),
                           ),
                         ),
                         Card(
                           child: ListTile(
                             title: const Text('Equity'),
                             subtitle: Text(Utils.formatDoubleToTwoDecimalPlaces(_homeController.accountInfo.value.equity!)),
                           ),
                         ),
                         Card(
                           child: ListTile(
                             title: const Text('Free Margin'),
                             subtitle: Text(Utils.formatDoubleToTwoDecimalPlaces(_homeController.accountInfo.value.freeMargin!)),
                           ),
                         ),
                         Card(
                           child: ListTile(
                             title: const Text('Total Trades Count'),
                             subtitle: Text(Utils.formatDoubleToTwoDecimalPlaces(_homeController.accountInfo.value.totalTradesCount!)),
                           ),
                         ),
                         Card(
                           child: ListTile(
                             title: const Text('Total Trades Volume'),
                             subtitle: Text(Utils.formatDoubleToTwoDecimalPlaces(_homeController.accountInfo.value.totalTradesVolume!)),
                           ),
                         ),
                         Card(
                           child: ListTile(
                             title: const Text('Last Four Digit of Phone'),
                             subtitle: Text(_homeController.lastFourDigits.value.toString()),
                           ),
                         ),


                       ],
                     )
                   ],
                  )),
            ))*/
          ],
        ),
      ),
    );
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Do you want to exit?"),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            //  print('yes selected');
                            exit(0);
                          },
                          child: const Text("Yes",style: TextStyle(
                            color: Colors.white
                          ),),
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.appColor),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          //  print('no selected');
                          Navigator.of(context).pop();
                        },
                        child: const Text("No",
                            style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  late List<Parcel> parcels;
  String query = '';

  Future<void> _pullRefresh() async {
    parcelController.fetchParcels();
    parcels = parcelController.contentList;
  }

  @override
  void initState() {
    parcelController.fetchParcels();
    parcels = parcelController.contentList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(Constants.appName,
              style: TextStyle(
                fontSize: Utils.responsiveFontSize(18, context),
              ))),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: AppColors.appColor,
        onPressed: () {
          parcelController.isUpdateMode.value = false;
          parcelController.resetFormFields();
          Get.to(() => CreateUpdatePage());
        },
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          }
          showExitPopup(context);
        },
        child: Column(
          children: [
            buildSearch(),
            Obx(
              () => Text(
                "Total Elements: ${parcelController.totalElements}, Page: ${parcelController.page},"
                " Size: ${parcelController.size}",
                style: TextStyle(
                    fontSize: Utils.responsiveFontSize(12, context),
                    fontStyle: FontStyle.italic),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: RefreshIndicator(
                    onRefresh: _pullRefresh,
                    child: Obx(
                      () => ListView.builder(
                          itemCount: parcelController.contentList.length,
                          itemBuilder: (context, index) {
                            try {
                              final item = parcels[index];
                              return buildList(item);
                            } catch (e) {
                              print(e);
                              return Container();
                            }
                          }),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Invoice/Name/Phone/City/OrderId',
        onChanged: searchItem,
      );

  void searchItem(String query) {
    final item = parcelController.contentList.where((book) {
      final recipientName = book.recipientName.toString().toLowerCase();
      final recipientPhone = book.recipientPhone.toString().toLowerCase();
      final invoice = book.invoice.toString().toLowerCase();
      final recipientCity = book.recipientCity.toString().toLowerCase();
      final merchantOrderId = book.merchantOrderId.toString().toLowerCase();
      final searchLower = query.toLowerCase();

      return recipientName.contains(searchLower)
            ||recipientPhone.contains(searchLower)
            ||recipientPhone.contains(searchLower)
            ||invoice.contains(searchLower)
            ||merchantOrderId.contains(searchLower)
            ||recipientCity.contains(searchLower
          );
    }).toList();

    setState(() {
      this.query = query;
      this.parcels = item;
    });
  }

  Widget buildList(Parcel item) {
    return ParcelListTile(
        onEdit: () {
          parcelController.isUpdateMode.value = true;
          Get.to(() => CreateUpdatePage());
          parcelController.fetchParcelById(item.id);
        },
        recipientName: item.recipientName,
        recipientPhone: item.recipientPhone,
        recipientCity: item.recipientCity,
        recipientAddress: item.recipientAddress,
        amountToCollect: item.amountToCollect.toString(),
        invoice: item.invoice.toString(),
        itemQuantity: item.itemQuantity.toString(),
        merchantOrderId: item.merchantOrderId.toString(),
        date: item.createdAt.toString());
  }

}
