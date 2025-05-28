import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_practice_projects/Tourist%20Spots%20(Gridview)/locations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const Locations(),
    );
  }
}
