import 'dart:async';
import 'package:challenge_frontend/sectors/add.dart';
import 'package:challenge_frontend/sectors/signup.dart';
import 'package:challenge_frontend/sectors/view.dart';
import 'package:challenge_frontend/sectors/edit.dart';
import 'package:challenge_frontend/welcome/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/add': (context) => const AddScreen(),
        '/view': (context) => const ViewScreen(),
        '/edit': (context) => const UpdateScreen(),
        '/signup': (context) => const Signup(),
      },
      title: 'Challenge Frontend',
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Signup()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo here
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "BUSSINESS SECTOR",
                    style: TextStyle(color: Color(0xFF1A237E), fontSize: 18),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: Column(children: [
                const Text(
                  "copyright @ Bussiness Sector 2022",
                  style: TextStyle(fontSize: 10),
                )
              ]),
            )

            // SizedBox(
            //   height: 20,
            // ),
            // CircularProgressIndicator(
            //   valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            // )
          ],
        ),
      ),
    );
  }
}
