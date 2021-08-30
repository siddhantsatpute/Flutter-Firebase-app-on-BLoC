//***************************************************************
// Created By Siddhant Satpute on 30-August-2021
// Project Github URL - [https://github.com/siddhantsatpute]
// © Siddhant Satpute
//****************************************************************

///This project is the demo of the BLoC architecture of flutter app developement, using Firebase as
///backend. Basically BLoC stand for Business(B) Logic(Lo) Component(C). It is developed by Felix Angelov.

///BLoC allow developers to write business logic code separately from the main UI code in reactive
///manner. Also when we are using BLoC then it is intended that we don't have to use flutter's own
///setState(() {}) method to update the state. Here for updating the state of the widget we create
///different states, their respective events and business logic associated with it. Although all these
///things will be written down in separate files.

import 'package:firebase_app_bloc/LoginScreen/loginscreen_ui.dart';
import 'package:flutter/material.dart';

//Main function to initiate the app.
void main(){
  //Call to run the app
  runApp(FirebaseDemoApp());
}

///[FirebaseDemoApp] Class to initiate/start the very 1st screen of the app.
class FirebaseDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: LoginScreen(),
      );
  }
}