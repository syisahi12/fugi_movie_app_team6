import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team6/constant/colors.dart';
import 'package:fugi_movie_app_team6/screen/home/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initScreen() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const Home(),
    ));
  }

  @override
  void initState() {
    Timer(const Duration(milliseconds: 4500), initScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                kBackground,
                kBackground,
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 123,
                    width: 137,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/splash.png'), fit: BoxFit.cover)),),
              ],
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kFouthColor),
            ),
          ],
        ),
      ),
    );
  }
}
