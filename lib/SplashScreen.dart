import 'dart:async';

import 'package:bmicalculator/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:screenapp/main.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => MyHomePage(title: 'BMI'),));
    });
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(

       color: Colors.blue,
       child: Center(
         child: Text('BMI',style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),),
       ),
     ),
   );
  }
}