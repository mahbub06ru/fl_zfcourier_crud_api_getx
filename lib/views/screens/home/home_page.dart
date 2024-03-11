import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_zfcourier_crud_api/controller/parcel_controller.dart';
import 'package:flutter_zfcourier_crud_api/models/parcel/list.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controller/auth_controller.dart';
import '../../../styles/app_colors.dart';
import '../../../utils/constants.dart';
import '../../widgets/list_tile.dart';
import '../../widgets/seach_widget_repo.dart';
import '../../widgets/skeleton_card.dart';
import '../parcel_ceate_update_screen.dart';
import '../search/search_screen.dart';

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
              height: 90,
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
                          child: const Text("Yes"),
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

  late List<Parcel> books;
  String query = '';

  Future<void> _pullRefresh() async {
    // controller.getCustomerList();
  }

  @override
  void initState() {
    parcelController.fetchParcels();
    books = parcelController.contentList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.appName),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.person_outline,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
        onPressed: () {
          // _showProductModalBottomSheet(Get.context!);
          parcelController.isUpdateMode.value = false;
          /*if (parcelController.isUpdateMode.value) {
            parcelController.updateParcel();
          } else {
            parcelController.createParcel();
          }*/
          parcelController.resetFormFields();
          Get.to(() => ParcelCreateUpdatePage());
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
                  "Total Elements: ${parcelController.totalElements}, Page: ${parcelController.page}, Size: ${parcelController.size}"),
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
                              final book = books[index];
                              return buildBook(book);
                            } catch (e) {
                              print(e);
                              return Container();
                            }
                          }),
                    )),
              ),
            ),
            /* Expanded(
              child: Obx(
                    () => ListView.builder(
                  itemCount: parcelController.contentList.length,
                  itemBuilder: (context, index) {
                    final content = parcelController.contentList[index];
                    return Card(
                      child: GestureDetector(
                        onTap: (){
                          // Get.to(()=>SearchPage());
                          parcelController.isUpdateMode.value = true;
                          */ /*if (parcelController.isUpdateMode.value) {
                            parcelController.updateParcel();
                          } else {
                            parcelController.createParcel();
                          }*/ /*
                          Get.to(()=>ParcelCreateUpdatePage());
                          parcelController.fetchParcelById(content.id);
                        },
                        child: ListTile(
                          title: Text(content.recipientName ?? ""),
                          subtitle: Text(content.status ?? ""),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Customer Name/Code',
        onChanged: searchBook,
      );

  void searchBook(String query) {
    final books = parcelController.contentList.where((book) {
      final titleLower = book.recipientName.toString().toLowerCase();
      final authorLower = book.recipientPhone.toString().toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.books = books;
    });
  }

  Widget buildBook(Parcel book) {
    return GestureDetector(
      onTap: () {
        parcelController.isUpdateMode.value = true;
        Get.to(() => ParcelCreateUpdatePage());
        parcelController.fetchParcelById(book.id);
      },
      child: ListTile(
        title: Text(book.recipientName ?? ""),
        subtitle: Text(book.status ?? ""),
      ),
    );
  }

/*  Widget buildBook(Parcel book) => InfoListTile(
      index: book.toString(),
      id: book.customerAuditID.toString(),
      title: book.customerName.toString(),
      code: book.customerCode.toString(),
      onEdit: () {
        _onEdit(
            book.customerAuditID.toString(),
            book.customerCode,
            book.customerName,
            book.creditLimit.toString(),
            book.creditDays,
            book.moMsoName,
            book.moMsoCode,
            book.aeAmName,
            book.aeAmCode,
            book.zsmRsmName,
            book.zsmRsmCode,
            book.smName,
            book.smCode,
            book.address,
            book.contactNo,
            book.smsDue,
            book.asPerAci,
            book.asPerCustomer,
            book.gap,
            book.totalStock,
            book.freshStock,
            book.damagedStock,
            book.businessWithOtherCode,
            book.salesProcceedsThroughTmr,
            book.salesProcceedsThroughTmr2,
            book.auditDate.toString());
      });*/
}
