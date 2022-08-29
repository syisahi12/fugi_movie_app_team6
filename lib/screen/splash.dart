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
          children: const [
            Icon(
              Icons.video_library_rounded,
              size: 150,
              color: Colors.white,
            ),
            SizedBox(height: 30),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kFouthColor),
            ),
          ],
        ),
      ),
    );
  }
}
