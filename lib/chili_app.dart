import 'package:chili_app/pages/pages.dart';
import 'package:chili_app/resources/resources.dart';
import 'package:flutter/material.dart';

class ChiliApp extends StatelessWidget {
  const ChiliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const EnterPage(),
    );
  }
}
