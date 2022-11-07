import 'package:animationbmi/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controllre.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Offset>? boxx;
  Animation<Offset>? boxy;

  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
    AnimationController(vsync: this, duration: Duration(seconds: 1))
      ..forward();

    boxx = Tween<Offset>(
      begin: Offset(-5, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
        parent: _animationController!, curve: Curves.decelerate));
    boxy = Tween<Offset>(
      begin: Offset(5, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
        parent: _animationController!, curve: Curves.decelerate));

    _animationController!.addListener(
          () {
        setState(
              () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo.shade900,
        appBar: AppBar(
          backgroundColor: Colors.indigo.shade900,
          elevation: 0,
          title: Text(
            "BMI CLACULATOR",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(onPressed: (){
              homeController.clear();
            }, icon: Icon(Icons.refresh,size: 30,))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SlideTransition(
                    position: boxx!,
                    child: InkWell(
                      onTap: (){
                        homeController.select.value = true;
                        homeController.selected.value = false;
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade400,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                    ()=> Icon(Icons.male_rounded,
                                    size: 90, color: homeController.select.isTrue?Colors.pink:Colors.white60),
                              ),
                              Text(
                                "MALE",
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.white60,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: boxy!,
                    child: InkWell(
                      onTap: (){
                        homeController.select.value = false;
                        homeController.selected.value = true;
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, top: 20),
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade400,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                    ()=> Icon(Icons.female_rounded,
                                    size: 90, color: homeController.selected.isTrue?Colors.pink:Colors.white60),
                              ),
                              Text(
                                "FEMALE",
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.white60,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 35,
              ),
              SlideTransition(
                position: boxy!,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade400,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: TextStyle(color: Colors.white60, fontSize: 18),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                                  () => Text(
                                "${homeController.height.value.toInt()}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              "CM",
                              style:
                              TextStyle(fontSize: 22, color: Colors.white60),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Obx(
                              () => Slider(
                            value: homeController.height.value,
                            max: 250,
                            activeColor: Colors.pink,
                            inactiveColor: Colors.white,
                            onChanged: (double value) {
                              homeController.changevalue(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SlideTransition(
                    position: boxx!,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade400,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 5,),
                            Text(
                              "WEIGHT",
                              style:
                              TextStyle(color: Colors.white60, fontSize: 18),
                            ),

                            SizedBox(height: 3,),

                            Obx(
                                  () => Text(
                                "${homeController.weight}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 27,
                                  backgroundColor: Colors.indigo.shade900,
                                  child: IconButton(
                                    onPressed: () {
                                      homeController.weight++;
                                    },
                                    color: Colors.white,
                                    icon: Icon(Icons.add),
                                  ),
                                ),
                                SizedBox(width: 13,),
                                CircleAvatar(
                                  radius: 27,
                                  backgroundColor: Colors.indigo.shade900,
                                  child: IconButton(
                                    onPressed: () {
                                      homeController.weight--;
                                    },
                                    color: Colors.white,
                                    icon: Icon(Icons.remove),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: boxy!,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade400,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          children: [

                            SizedBox(height: 5,),

                            Text(
                              "AGE",
                              style:
                              TextStyle(color: Colors.white60, fontSize: 18),
                            ),

                            SizedBox(height: 3,),

                            Obx(
                                  () => Text(
                                "${homeController.Age}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 27,
                                  backgroundColor: Colors.indigo.shade900,
                                  child: IconButton(
                                    onPressed: () {
                                      homeController.Age++;
                                    },
                                    color: Colors.white,
                                    icon: Icon(Icons.add),
                                  ),
                                ),
                                SizedBox(width: 13,),
                                CircleAvatar(
                                  radius: 27,
                                  backgroundColor: Colors.indigo.shade900,
                                  child: IconButton(
                                    onPressed: () {
                                      homeController.Age--;
                                    },
                                    color: Colors.white,
                                    icon: Icon(Icons.remove),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: (){
                  homeController.bmicalculate();
                  homeController.Result();
                  homeController.Interpretation();
                  if(homeController.select.isTrue || homeController.selected.isTrue)
                  {
                    Get.to(SecondScreen());
                  }
                },
                child: Container(
                  height: 70,
                  width: double.infinity,
                  color: Colors.pink,
                  alignment: Alignment.center,
                  child: Text("CALCULATE YOUR BMI",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w500),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}