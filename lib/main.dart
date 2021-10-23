import 'package:DiaryApp/screen/DiaryPage.dart';
import 'package:DiaryApp/screen/SelectCategoryPage.dart';
import 'package:DiaryApp/screen/SelectDiaryPage.dart';
import 'package:DiaryApp/screen/SelectMoodPage.dart';
import 'package:flutter/material.dart';

import 'screen/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DiaryPage(),
    );
  }
}
