import 'package:firebase_app_bloc/Screens/AddProductsScreen/addproductsscreen_ui.dart';
import 'package:firebase_app_bloc/Screens/RegisterScreen/registerscreen_bloc.dart';
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

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _registerscreenBloc = RegisterScreenBloc();
    _registerscreenBloc.add(RegistrationInitiatedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocProvider(
        create: (context) => _registerscreenBloc,
        child: BlocListener<RegisterScreenBloc, RegisterscreenState>(
          listener: (context, state) async {
            //Handle/Display Non UI binded widgets like dialogs, snackbar, navigator, etc.
            if (state is RegistrationSuccessState) {
              await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddProductsScreen()));
              _registerscreenBloc.add(RegistrationFailedEvent());
            }
          },
          child: BlocBuilder<RegisterScreenBloc, RegisterscreenState>(
              bloc: _registerscreenBloc,
              builder: (context, state) {
                if (state is RegistrationInitialState) {
                  return registerScreenUi(context);
                } else if (state is RegistrationInitiatedState) {
                  _registerscreenBloc.add(RegistrationInProgressEvent(
                      userName: _email.text, password: _password.text));
                } else if (state is RegistrationInProgressState) {
                } else if (state is RegistrationFailedState) {
                } else if (state is RegistrationValidationSuccessState) {
                } else if (state is RegistrationValidationFailedState) {
                } else if (state is RegistrationUnknownState) {}

                return registerScreenUi(context);
              }),
        ),
      ),
    ));
  }

  Widget registerScreenUi(BuildContext context) {
    return Form(
        child: Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _email,
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
            controller: _password,
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
              _registerscreenBloc.add(RegistrationInitiatedEvent());
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
