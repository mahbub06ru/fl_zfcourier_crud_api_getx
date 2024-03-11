import 'package:flutter/material.dart';

class ImageLoader {
  static const String rootPath = 'assets/icons/';

  static Image imageAsset(String icon) => Image.asset(rootPath + icon);

  static Image imageNet(String url) => Image.network(url);
}
