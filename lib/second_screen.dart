import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controllre.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo.shade900,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.indigo.shade900,
          title: Text(
            "BMI CLACULATOR",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
          ),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 150,),
              Text("${homeController.msg1}",style: TextStyle(color: Colors.greenAccent,fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(height: 100,),
              Text("${homeController.bmi.toStringAsFixed(2)}",style: TextStyle(color: Colors.white,fontSize: 80,fontWeight: FontWeight.bold),),
              SizedBox(height: 100,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 85,
                    child: Text("${homeController.msg2}",style: TextStyle(color: Colors.white60,fontSize: 25,fontWeight: FontWeight.bold),)),
              ),
              SizedBox(height: 47.3,),
              InkWell(
                onTap: (){
                  Get.back();
                  homeController.clear();
                },
                child: Container(
                  height: 70,
                  width: double.infinity,
                  color: Colors.pink,
                  alignment: Alignment.center,
                  child: Text("RE-CALCULATE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}