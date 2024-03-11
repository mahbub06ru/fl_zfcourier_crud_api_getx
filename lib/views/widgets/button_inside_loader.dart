import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomBtnInsideLoader extends StatelessWidget {
   bool process = false;
   bool loading = false;
  final Color? color;
  final Function() onPressed;
  final String titleText;
  final double? sizeTitle;
  final Color? textColor;
  final String? fontFamily;
  final double? waitSize;
  final Color? waitTextColor;
  final String? waitFontFamily;

  CustomBtnInsideLoader(
      {Key? key,
        required this.process,
        required this.loading,
        this.color,
        required this.onPressed,
        required this.titleText,
        this.sizeTitle,
        this.textColor,
        this.fontFamily,
        this.waitSize,
        this.waitTextColor,
        this.waitFontFamily
      }
      )
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return   SizedBox(
      width: screenSize.width,
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30),
        color: process
            ? color //Theme.of(context).disabledColor
            : color,
        child: process
            ? const CircularProgressIndicator()
            : MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(
              20, 15, 20, 15),
          onPressed: () async {
            onPressed();
          },
          child:loading == true
              ? Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(Constants.wait,
                    textAlign: TextAlign.center,
                    // softWrap: softWrap,
                    style:  TextStyle(
                      fontSize: waitSize,
                      fontFamily: waitFontFamily,
                      color: waitTextColor,
                      fontWeight:FontWeight.bold,
                    )),
                const SizedBox(
                  width: 5,
                ),
                const SizedBox(
                  height: 20,
                  width: 20,
                  child:
                  CircularProgressIndicator(
                    valueColor:
                    AlwaysStoppedAnimation(
                        Colors.white),
                    backgroundColor:
                    Colors.blueAccent,
                    strokeWidth: 3,
                  ),
                )
              ],
            ),
          )
              :  Text(titleText,
              textAlign: TextAlign.center,
              // softWrap: softWrap,
              style: TextStyle(
                fontSize: sizeTitle,
                fontFamily: fontFamily,
                color: textColor,
                fontWeight:FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
