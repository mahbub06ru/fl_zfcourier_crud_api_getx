import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../../utils/constants.dart';


class ParcelListTile extends StatefulWidget {

  final String? id;
  final String? recipientName;
  final String? recipientPhone;
  final String? recipientCity;
  final String? recipientArea;
  final String? recipientAddress;
  final String? amountToCollect;
  final String? invoice;
  final String? itemQuantity;
  final String? merchantOrderId;
  final String? date;


  final VoidCallback onEdit;


  ParcelListTile(
      { this.id,
        this.recipientName,
        this.recipientPhone,
        this.recipientCity,
        this.recipientArea,
        this.recipientAddress,
        this.amountToCollect,
        this.invoice,
        this.itemQuantity,
        this.merchantOrderId,
        this.date,
        required this.onEdit
      });

  @override
  State<ParcelListTile> createState() => _ParcelListTileState();
}

class _ParcelListTileState extends State<ParcelListTile>   {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        semanticContainer: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          decoration: const BoxDecoration(
            // Your decoration properties here
          ),
          child: Row(
            children: [
              Container(
                width: 10,
                height: 400,
                color: AppColors.appColor,
                child: const Text(''),// Change this to your desired color
              ),
              Expanded(
                child: Column(
                  children: [
                    InkWell(
                      onTap: ()=> widget.onEdit(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0,
                            top: 20,right: 20),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment
                              .start,
                          children: [
                            Row(
                              children: [
                                 Expanded(
                                  child: Text(
                                    'Recipient: ',
                                    maxLines: 1, style: TextStyle(
                                      fontSize: Utils.responsiveFontSize(16, context),
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blackshade
                                  ),),
                                ),
                                Expanded(
                                  child: Text(
                                    widget.recipientName==null?'':widget.recipientName!,
                                    maxLines: 2, style:  TextStyle(
                                      fontSize: Utils.responsiveFontSize(16, context),
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black
                                  ),),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Invoice: ',
                                    maxLines: 1, style: TextStyle(
                                      fontSize: Utils.responsiveFontSize(16, context),
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blackshade
                                  ),),
                                ),
                                Expanded(
                                  child: Text(
                                    widget.invoice==null?'':widget.invoice!,
                                    maxLines: 2, style:  TextStyle(
                                      fontSize: Utils.responsiveFontSize(16, context),
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black
                                  ),),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Phone: ',
                                    maxLines: 1, style: TextStyle(
                                      fontSize: Utils.responsiveFontSize(16, context),
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blackshade
                                  ),),
                                ),
                                Expanded(
                                  child: Text(
                                    widget.recipientPhone==null?'':widget.recipientPhone!,
                                    maxLines: 2, style:  TextStyle(
                                      fontSize: Utils.responsiveFontSize(16, context),
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black
                                  ),),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'City: ',
                                    maxLines: 1, style: TextStyle(
                                      fontSize: Utils.responsiveFontSize(16, context),
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blackshade
                                  ),),
                                ),
                                Expanded(
                                  child: Text(
                                    widget.recipientCity==null?'':widget.recipientCity!,
                                    maxLines: 2, style:  TextStyle(
                                      fontSize: Utils.responsiveFontSize(16, context),
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black
                                  ),),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Address: ',
                                    maxLines: 1, style: TextStyle(
                                      fontSize: Utils.responsiveFontSize(16, context),
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blackshade
                                  ),),
                                ),
                                Expanded(
                                  child: Text(
                                    widget.recipientAddress==null?'':widget.recipientAddress!,
                                    maxLines: 2, style:  TextStyle(
                                      fontSize: Utils.responsiveFontSize(16, context),
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black
                                  ),),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Amount to collect: ',
                                    maxLines: 1, style: TextStyle(
                                      fontSize: Utils.responsiveFontSize(16, context),
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blackshade
                                  ),),
                                ),
                                Expanded(
                                  child: Text(
                                    widget.amountToCollect==null?'':widget.amountToCollect!,
                                    maxLines: 2, style:  TextStyle(
                                      fontSize: Utils.responsiveFontSize(16, context),
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black
                                  ),),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                const Expanded(
                                  child: Text('Quantity:  ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black87
                                    ),),
                                ),
                                Expanded(
                                  child: Text(widget.itemQuantity==null?'':widget.itemQuantity!, style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),),
                                )
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    'Merchant orderId:  ', style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black87
                                  ),),
                                ),
                                Expanded(
                                  child: Text(
                                    widget.merchantOrderId==null?'':widget.merchantOrderId!, style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),),
                                )
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    'Created date:  ', style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black87
                                  ),),
                                ),
                                Expanded(
                                  child: Text(
                                    widget.date==null?'':Utils.convertDateTime(widget.date!), style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),),
                                )
                              ],
                            ),
                            const SizedBox(height: 20,)
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
