import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../../utils/constants.dart';


class InfoListTile extends StatefulWidget {
  // final Customer customerObj;
  // final VoidCallback clickItem;

  final String? id;
  final String? index;
  final String? title;
  final String? code;

  final String? imageUrl;
  final VoidCallback onEdit;


  InfoListTile(
      {required this.id,
        this.index,
       required this.title,
        this.code,
        this.imageUrl,
       required this.onEdit
      });

  @override
  State<InfoListTile> createState() => _InfoListTileState();
}

class _InfoListTileState extends State<InfoListTile> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        onTap: ()=> widget.onEdit(),
        child: Container(
          height: 65,
          child:   Card(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(10))
            ),
            elevation: 5,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Expanded(
                    flex: 7,
                    child: new  Container(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        children: [
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Customer: '+widget.title.toString(),
                              maxLines: 2,
                              style: TextStyle(
                                fontFamily: Constants.fontLatoRegular,
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Code: '+widget.code.toString(),
                              maxLines: 2,
                              style: TextStyle(
                                fontFamily: Constants.fontLatoRegular,
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child:  GestureDetector(
                      child: Icon(Icons.edit,
                          color: Colors.green),
                      onTap: ()=> widget.onEdit()

                    ),
                  ),
                   // Expanded(
                   //                    flex: 1,
                   //                    child:  GestureDetector(
                   //                        onTap: () => _showMyDialog(
                   //                            context, (e.customerInfoId)),
                   //                        child: Icon(Icons.delete,
                   //                            color: Colors.red)),
                   //                  ),
                  Divider(
                      color: AppColors.blue
                  )




                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
