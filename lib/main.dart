import 'package:flutter/material.dart';
import 'package:spiral_app/screen/mobile_desc.dart';
import 'package:spiral_app/screen/user.dart';

import 'export.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Mobile(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LandingPage.LandingRoute: (context) => LandingPage(),
        SearchPage.Route: (context) => SearchPage(),
        LoginPage.Route: (context) => LoginPage(),
        FilterPage.Route: (context) => FilterPage(),
        CompareScreen.Route: (context) => CompareScreen(),
        MobilePage.Route: (context) => MobilePage(),
        UserProfile.Route: (context) => UserProfile(),
        RecommendationPage.Route: (context) => RecommendationPage(),
        ContactUs.Route: (context) => ContactUs(),
        AboutUs.Route: (context) => AboutUs(),
      },
      initialRoute: LoginPage.Route,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
        appBarTheme: const AppBarTheme(color: Colors.black),
        buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          buttonColor: kPrimaryColor,
        ),
      ),
    );
  }
}
