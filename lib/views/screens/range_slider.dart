import 'package:flutter/material.dart';

class RangeSliderPage extends StatefulWidget {
  const RangeSliderPage({Key? key}) : super(key: key);

  @override
  State<RangeSliderPage> createState() => _RangeSliderPageState();
}

class _RangeSliderPageState extends State<RangeSliderPage> {
  double startval = 0, endval = 0.5;
  //iniital value for start range and end range
  double startval1 = 20, endval1 = 70;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
            title: Text("RangeSlider in Flutter"),
            backgroundColor: Colors.redAccent
        ),
        body: Container(
            padding: EdgeInsets.only(top:20, left:20, right:20),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Start Value: $startval", style:TextStyle(fontSize: 20)),
                Text("End Value: $endval", style:TextStyle(fontSize: 20)),

                Text("Start Value1: $startval1", style:TextStyle(fontSize: 20)),
                Text("End Value1: $endval1", style:TextStyle(fontSize: 20)),

                RangeSlider(
                  //by default, min-max: 0-1
                  values: RangeValues(startval, endval),
                  onChanged: (RangeValues value) {
                    setState(() {
                      startval = value.start;
                      endval = value.end;
                    });
                  },
                ),

                Padding(padding: EdgeInsets.all(20)),

                RangeSlider(
                  min: 0,
                  max: 100,
                  divisions: 10, //slide interval
                  labels: RangeLabels("Rs. $startval1", "Rs. $endval1"),
                  values: RangeValues(startval1, endval1),
                  onChanged: (RangeValues value) {
                    setState(() {
                      startval1 = value.start;
                      endval1 = value.end;
                    });
                  },
                )
              ],)
        )
    );
  }
}
