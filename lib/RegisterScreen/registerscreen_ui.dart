import 'package:firebase_app_bloc/RegisterScreen/registerscreen_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late RegisterScreenBloc _registerscreenBloc;

  @override
  void initState() {
    super.initState();
    _registerscreenBloc = RegisterScreenBloc();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocProvider(
        create: (context) => _registerscreenBloc,
        child: BlocListener(
          listener: (context, state) {
            //Handle/Display Non UI binded widgets like dialogs, snackbar, navigator, etc.
          },
          child: BlocBuilder(builder: (context, state) {
            if (state is RegistrationInitialState) {
            } else if (state is RegistrationInitiatedState) {
            } else if (state is RegistrationInProgressState) {
            } else if (state is RegistrationSuccessState) {
            } else if (state is RegistrationFailedState) {
            } else if (state is RegistrationValidationSuccessState) {
            } else if (state is RegistrationValidationFailedState) {
            } else if (state is RegistrationUnknownState) {}

            return registerScreenUi();
          }),
        ),
      ),
    ));
  }

  Widget registerScreenUi() {
    return Form(
        child: Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              alignLabelWithHint: true,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              alignLabelWithHint: true,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              //_registerscreenBloc.add(RegistrationInitiatedEvent());
            },
            style: ElevatedButton.styleFrom(
                fixedSize: Size(150, 50), primary: Colors.blue),
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          RichText(
              text: TextSpan(
                  text: 'Do not have an account? ',
                  style: TextStyle(color: Colors.black),
                  children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //Open Register Screen here...
                        print('Register');
                      },
                    text: 'Register',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold))
              ]))
        ],
      ),
    ));
  }
}
