// ignore_for_file: file_names, camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace


import 'package:flutter/material.dart';
import 'package:recette/Screen/HomeScreen.dart';
import 'package:recette/constant.dart';

class OnBearScreen extends StatefulWidget {
  const OnBearScreen({Key? key}) : super(key: key);

  @override
  _OnBearScreenState createState() => _OnBearScreenState();
}

class _OnBearScreenState extends State<OnBearScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              Positioned(
                bottom: 84.0,
                left: 52.0,
                child: Image.asset("assets/images/smallDot.png"),
                ),
              Positioned(
                bottom: 32.0,
                left: 84.0,
                child: Image.asset("assets/images/mediumDot.png"),
                ),
                Align(
                alignment: Alignment.centerRight,
                child: Image.asset("assets/images/bigDot.png", height: 430,),
                ),
                // Align(
                // alignment: Alignment.centerLeft,
                // child: Image.asset("assets/images/femmeombre.png"),
                // ),
                Align(
                alignment: Alignment.center,
                child: Image.asset("assets/images/beardGround.png",  scale: 0.6,),
                ),
              ]
            ),
            Container(
              height: 265,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 32, right: 32, bottom: 25),
              padding:  const EdgeInsets.symmetric(vertical: 15.0),
              decoration:  BoxDecoration(
                color: kDarkColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow:[ BoxShadow(
                      offset: Offset(0, 8),
                      blurRadius: 6.0,
                    ),
                   ]
              ),
              child: Column(
                children: [
                  Image.asset('assets/icons/indicator.png'),
                  SizedBox(height: 28.0),
                  Text(
                  'simplifiez votre \n plan de cuisson',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20, color: kLightFontColor, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 24.0),
                Text(
                  'plus de confusion sur  votre \n menu de repas',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontSize: 13, color: kDarkGreyFontColor, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 25.0),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen())),
                  child: Container(
                    height: 50,
                    width: 230.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(18.0),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(4, 4),
                          blurRadius: 5.0,
                         )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                        'Allons-y',
                        style: TextStyle(
                          color: kDarkColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                         )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Image.asset('assets/icons/arrow.png'),
                        ),
                      ],
                    )
                   ),
                ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
