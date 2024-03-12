
import 'package:flutter/material.dart';


class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  static String route() => '/shop_detail';

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [

          ],
        ),
      ),
    );
  }

}

