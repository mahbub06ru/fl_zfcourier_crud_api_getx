import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Constants {
  static const String appName = "ZF Courier";
  static const String phone = "ZF Courier";
  static const String password = "ZF Courier";
  static const String wait = "loading ...";
}
class Utils {
  static showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static List<T> modelBuilder<M, T>(
      List<M> models, T Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, T>((index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();

  static String convertDateTime(String dateTimeString) {
    try {
      final dateTime = DateTime.parse(dateTimeString);
      // final format = DateFormat('yyyy:MM:dd:ss');
      // final format = DateFormat('yyyy-MM-dd');
      final format =  DateFormat('dd MMMM y hh.mm a');

      return format.format(dateTime);
    } catch (e) {
      print(e);
      return dateTimeString;
    }
  }


  static int  arrayToInt(items) {
    // List cities = ['NY', 'LA', 'Tokyo'];
    // List cities = items;
    int  s = items.join(',');
    // int value = int.parse(s) ;
    var inVal = s+1;
    return s;
  }
  static curleyBracesvalueIntoString(items) {
    // String curlyBraces = '{John, Alice, Bob}';

    var commaSeparatedValues = items
        .substring(1, items.length - 1) // Remove the curly braces
        .split(', ') // Split the values by comma and space
        .join(','); // Join the values with a comma

    return (commaSeparatedValues); // Output: John, Alice, Bob
  }

  static Map<int, String>  stringToArray(String item) {
    final tagName = item;
    final split = tagName.split(',');
    final Map<int, String> values = {
      for (int i = 0; i < split.length; i++)
        i: split[i]
    };
    return values;
  }

  static Color getAppBarColor(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.android) {
      return Colors.blue; // Android style color
    } else {
      return CupertinoColors.systemBlue; // iOS style color
    }
  }

  static double getAppBarElevation(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.android) {
      return 4.0; // Android style elevation
    } else {
      return 0.0; // iOS style elevation
    }
  }

  static Widget getAppBarLeading(BuildContext context) {
    if (Theme.of(context).platform != TargetPlatform.android) {
      return InkWell(onTap:(){
        Navigator.of(context).pop();
      },child: const Icon(Icons.arrow_back)
      );
      // Android style back arrow
    } else {
      return CupertinoNavigationBarBackButton(
        color: Colors.white,
        // previousPageTitle: 'Back',
        onPressed: () {
          Navigator.of(context).pop();
        },
      ); // iOS style back arrow
    }
  }

  static double responsiveWidth(BuildContext context, double value) {
    final screenWidth = MediaQuery.of(context).size.width;
    return (value / 375.0) * screenWidth;
  }
  static double responsiveHeight(BuildContext context, double value) {
    final screenHeight = MediaQuery.of(context).size.height;
    return (value / 812.0) * screenHeight;
  }
  static double responsiveFontSize(double referenceFontSize, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // You can adjust this ratio to control the responsiveness
    const double referenceWidth = 375.0;
    final ratio = screenWidth / referenceWidth;
    return referenceFontSize * ratio;
  }


}