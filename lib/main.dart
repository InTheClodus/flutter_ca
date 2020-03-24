import 'package:flutter/material.dart';

import 'appEntry.dart';
import 'config.dart';

void main() {
  Config.appFlavor = Flavor.RELEASE;
  runApp(new MyApp());
}