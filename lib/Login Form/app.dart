import 'package:flutter/material.dart';
import 'login_form.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projects',
      home: LoginForm(),
    );
  }
}
