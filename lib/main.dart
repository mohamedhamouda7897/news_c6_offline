import 'package:flutter/material.dart';
import 'package:news_c6_offline/modules/home/home.dart';
import 'package:news_c6_offline/modules/home/news_fragment.dart';
import 'package:news_c6_offline/shared/styles/my_themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routeName ,
      routes: {

        HomeScreen.routeName:(conteext)=>HomeScreen()
      } ,
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
