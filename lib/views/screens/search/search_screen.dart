import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/parcel_controller.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ParcelController parcelController = Get.find();

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Parcels"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: const InputDecoration(labelText: "Enter Search Parameter"),
            ),
            ElevatedButton(
              onPressed: () async {
                await parcelController.fetchParcelsBySearch(
                  searchParam: searchController.text,
                );
              },
              child: const Text("Search Parcels"),
            ),
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  itemCount: parcelController.contentList.length,
                  itemBuilder: (context, index) {
                    final content = parcelController.contentList[index];
                    return Card(
                      child: GestureDetector(
                        onTap: (){
                          Get.to(()=>SearchPage());
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
            ),
          ],
        ),
      ),
    );
  }
}
