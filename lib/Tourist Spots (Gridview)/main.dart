import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_practice_projects/Tourist%20Spots%20(Gridview)/app.dart';

void main(){
  runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => MyApp(),
      )
  );
}