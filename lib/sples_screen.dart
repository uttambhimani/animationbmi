import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    timer();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo.shade900,
        body: Center(
          child: Column(
            children: [

              SizedBox(height: 100,),

              Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                ),
                child: Icon(Icons.volunteer_activism_sharp,color: Colors.pink,size: 50,),
              ),

              SizedBox(height: 30,),

              Text("BMI CALCULATOR",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 25)),

              SizedBox(height: 300,),

              CircularProgressIndicator(
                color: Colors.pink,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void timer()
  {
    Timer(
        Duration(seconds: 4),
            () => Get.offAll(HomeScreen())
    );
  }
}