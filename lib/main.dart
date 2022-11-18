import 'package:coder/pages/home_page.dart';
import 'package:coder/pages/login_page.dart';
import 'package:coder/utils/routes.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      //THEME FOR THE MATERIAL APP
      //home: const HomePage(),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,   //it overrides the primarySwatch properties
        //primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false, // => to remove the debug banner
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Comfortaa',
      ),
      //initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),

      },
    );
  }
}
