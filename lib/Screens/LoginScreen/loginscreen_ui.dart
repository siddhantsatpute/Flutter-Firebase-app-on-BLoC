//***************************************************************
// Created By Siddhant Satpute on 30-August-2021
// Project Github URL - [https://github.com/siddhantsatpute]
// © Siddhant Satpute
//****************************************************************

import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:firebase_app_bloc/AddProductsScreen/addproductsscreen_ui.dart';
import 'package:firebase_app_bloc/Screens/LoginScreen/loginscreen_bloc.dart';
import 'package:firebase_app_bloc/Screens/RegisterScreen/registerscreen_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///This is an example of Login screen using Firebase authetication of Email & Password.

//This is Login screen initiation
class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

//Login screen state handling class
class _LoginScreenState extends State<LoginScreen> {
  ///Declaring an instance of [LoginscreenBloc] to use bloc for state management of Login screen.
  late LoginscreenBloc _loginscreenBloc;

  TextEditingController _emailCOntroller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    ///Initializing [LoginscreenBloc] instance
    _loginscreenBloc = LoginscreenBloc();

    ///Adding initial state into bloc
    _loginscreenBloc.add(LoginscreenInitialEvent());
  }

  ///Main UI build method to build/render the UI of Login Screen.
  ///Below [build] method has main 3 components of BLoC architecture i.e.
  ///[BlocProvider], [BlocListener] and [BlocBuilder].
  ///All these 3 has different usage in BLoC architecture of [_LoginScreenState].

  ///Hirearchy is like [BlocProvider] -> [BlocListener] -> [BlocBuilder]

  ///[BlocProvider] -> It is the main building block of BLoC architecture in flutter.
  ///[BlocProvider] allows to create/initiate bloc for that screen.

  ///[BlocListener] -> It is used as the child of the [BlocProvider] method. This widget listens
  ///for the state changes for the screen.
  ///NOTE : If want to show dialog, snackbar, or toast or navigator to move on another screen or
  ///any other UI widgets which does not have direct connection with screen UI, should be handled
  ///inside [BlocListener].

  ///[BlocBuilder] -> It is used as the child of [BlocListener]. This widget is
  ///responsible to handle the different states of the Login Screen which is declared in [LoginscreenState]
  ///and to build/update the UI as the state changes.

  ///Inside every state there is a trigger to update to state when the operation is performed.
  ///As we declared the [_loginscreenBloc] as the instance of [LoginscreenBloc], so to update the state
  ///we call add() method of [_loginscreenBloc].

  ///Each state will return the [Widget] from [BlocBuilder] to handle the UI as per state change.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            //Initiating bloc
            create: (context) => _loginscreenBloc,
            //Registering BlocListener as the child of BlocProvider
            child: BlocListener<LoginscreenBloc, LoginscreenState>(
              listener: (context, state) async {
                //Handling state of Login in progress. Here as we want to show the loading dialog
                //hence we are handling it in BlocListener.
                if (state is LoginScreenLoginInProgressState) {
                  log('Login in progress State');
                  Timer(Duration(seconds: 5), () {
                    _loginscreenBloc.add(LoginScreenLoginSuccessEvent());
                  });
                  loginForm(context);
                  showLoader(context);
                }

                //State to handle avigation to register screen
                else if (state is LoginScreenMoveToRegisterScreenState) {
                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegisterScreen()));

                  _loginscreenBloc.add(LoginscreenInitialEvent());
                }

                //State to handle login success state
                else if (state is LoginScreenLoginSuccessState) {
                  log('Login Success State');
                  hideLoader(context);
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddProductsScreen()));

                  _loginscreenBloc.add(LoginscreenInitialEvent());
                }

                ///All the widgets which is not binded directly with the UI of the screen,
                ///will be handled here inside BlocListener.
              },

              //Registering Blocbuilder as the child of the BlocListener to handle the
              //states which has direct connection with the screen such as Textfields, buttons,
              //Inkwell, GestureDetector, etc.
              child: BlocBuilder<LoginscreenBloc, LoginscreenState>(
                bloc: _loginscreenBloc,
                builder: (context, state) {
                  //State to handle initial state
                  if (state is LoginscreenInitialState) {
                    log('Login Initial State');
                    return loginForm(context);
                  }

                  //State to handle login intiated state - triggers when user tap on Login button
                  else if (state is LoginScreenLoginInitiatedState) {
                    log('Login Initiated State');
                    _loginscreenBloc.add(LoginScreenLoginInProgressEvent(
                        userName: _emailCOntroller.text,
                        password: _passwordController.text));
                    return Container();
                  }

                  //State to handle login failure state
                  else if (state is LoginScreenLoginFailedState) {
                    log('Login Failed State');
                    log('Login Failed...');
                    return Container();
                  }

                  //When no state is matched then this condition will executed
                  else {
                    log('Unknown state found. Please handle the BLoC state properly');
                    return Container();
                  }
                },
              ),
            )));
  }

  //Display the login form UI
  Widget loginForm(BuildContext context) {
    FocusNode emailFocus = FocusNode();
    FocusNode passwordFocus = FocusNode();

    bool _isPasswordVisible = false;

    return Form(
        child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        //Colors.teal.shade200,
        Colors.white,
        Colors.deepPurple.shade200
      ], stops: [
        0.1,
        2.0
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailCOntroller,
            focusNode: emailFocus,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              focusColor:
                  emailFocus.hasFocus ? Colors.deepPurple : Colors.transparent,
              fillColor:
                  emailFocus.hasFocus ? Colors.deepPurple : Colors.transparent,
              labelText: 'Email',
              alignLabelWithHint: true,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _passwordController,
            focusNode: passwordFocus,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                focusColor: emailFocus.hasFocus
                    ? Colors.deepPurple
                    : Colors.transparent,
                fillColor: emailFocus.hasFocus
                    ? Colors.deepPurple
                    : Colors.transparent,
                labelText: 'Password',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  icon: Icon(_isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  color: Colors.black,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              _loginscreenBloc.add(LoginScreenLoginInitiatedEvent());
            },
            style: ElevatedButton.styleFrom(
                fixedSize: Size(150, 50), primary: Colors.deepPurple.shade300),
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
                        _loginscreenBloc
                            .add(LoginScreenMoveToRegisterScreenEvent());
                        print('Register');
                      },
                    text: 'Register',
                    style: TextStyle(
                        color: Colors.deepPurple.shade400,
                        fontWeight: FontWeight.bold))
              ]))
        ],
      ),
    ));
  }

  //Display the loading on main UI when loading data from server
  showLoader(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
              child: Center(
                  child: Container(
                height: 100,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                    Text(
                      'Loading...',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),
            ),
          );
        });
  }

  //Hides the loading from main UI
  void hideLoader(BuildContext context) {
    Navigator.pop(context);
  }

  //Move to Register screen
  void moveToRegisterScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RegisterScreen()));
  }
}
