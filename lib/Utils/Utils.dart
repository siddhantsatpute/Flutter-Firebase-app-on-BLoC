import 'dart:ui';

import 'package:flutter/material.dart';

//Display the loading on main UI when loading data from database or from server
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
