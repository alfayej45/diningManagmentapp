import 'dart:async';


import 'package:diningmanagement/view/homepage.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../admin/view/adminhome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var box = Hive.box('user');
 @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 10), ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>box.get("type")=="user"? HomePage():AdminHome())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/splashlogo.png"),
            CircularProgressIndicator()
          ],
        )
      ),
    );
  }
}