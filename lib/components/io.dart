// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:chat_app/pages/log_in.dart';

class IO extends StatefulWidget {
  const IO({Key? key}) : super(key: key);

  @override
  State<IO> createState() => _IOState();
}

class _IOState extends State<IO> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LogIn()));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 181, 181, 181),
        body: Container(
          height: myHeight,
          width: myWidth,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: myHeight * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(''),
                Text(
                  'Social Swap',
                  style: TextStyle(
                      fontSize: 60,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  child: Column(children: [
                    Image.asset('images/logo.png', height: 300.0, width: 300.0,),
                  ]),
                ),
                Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Developed by shCodeX',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    
                    Image.asset(
                      'assets/image/loading1.gif',
                      height: myHeight * 0.015,
                      color: Colors.black,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
