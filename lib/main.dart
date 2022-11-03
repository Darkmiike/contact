import 'package:contact/screens/home_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Contact',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          useMaterial3: true,
        ),
        home: const HomeScreen() //AnimatedSplashScreen(
        //splashTransition: SplashTransition.fadeTransition,
        //splashIconSize: 3000,
        //duration: 3000,
        //splash: Icons.contact_phone_outlined,
        //nextScreen: const HomeScreen(),
        // ),
        );
  }
}
