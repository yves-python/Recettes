// ignore_for_file: file_names, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, equal_keys_in_map

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:recette/constant.dart';

class DetailScreen extends StatefulWidget {
  final int index;
  final String image, name, time, lvl;

  const DetailScreen(this.index, this.image, this.name, this.time, this.lvl,
      {Key? key})
      : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   print(
  //       "index:${widget.index},image:${widget.image},name:${widget.name},time:${widget.time},lvl:${widget.lvl},");
  // }
  int selectedIndex = 0;
  List tabs = ["Instructions", "Ingrediants"];
  List ingrediantList = [
    {
      "images": "assets/images/frite.png",
      "nom": "frite"
    },
    {
      "images": "assets/images/piment.png",
      "nom": "piment"
    },
    {
      "images": "assets/images/poulet.png",
      "nom": "poulet"
    },
    {
      "images": "assets/images/tomato.png",
      "nom": "tomato"
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 65.0,
                bottom: 0.0,
                right: 32.0,
                left: 32.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 18.0,
                        right: 10.0,
                        top: 12.0,
                        bottom: 12.0,
                      ),
                      decoration: BoxDecoration(
                          color: kLightgreyColor,
                          borderRadius: BorderRadius.circular(14.0)),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 24.0,
                        color: kDarkGreyFontColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print("Favori"),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          color: kLightRedColor,
                          borderRadius: BorderRadius.circular(14.0)),
                      child: Icon(
                        Icons.favorite,
                        size: 24.0,
                        color: kRedColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Hero(
                  tag: "tag${widget.index}",
                  child: Image.network( 
                    widget.image,
                    height: 180.0,
                    width: 180.0,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 35.0,
                  right: -25.0,
                  child: Image.asset(
                    "assets/images/corriender1.png",
                    height: 65.0,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  bottom: 35.0,
                  left: -25.0,
                  child: Image.asset(
                    "assets/images/corriender2.png",
                    height: 65.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            //      D  E  T  A  I  L
            Container(
                // height: 350.0,
                width: MediaQuery.of(context).size.width,
                // margin: EdgeInsets.only(top: 28.0),
                padding: const EdgeInsets.symmetric(vertical: 28.0),
                decoration: BoxDecoration(
                  color: kLightgreyColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 5.0,
                      width: 30.0,
                      margin: const EdgeInsets.only(bottom: 20.0),
                      decoration: BoxDecoration(
                        color: kDarkGreyFontColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        widget.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          color: kLightFontColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              "assets/icons/time1.png",
                              height: 35.0,
                              width: 35.0,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "${widget.time} Minute",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: kLightFontColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              "Cuisson",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: kDarkGreyFontColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: List.generate(
                            12,
                            (index) => Container(
                              height: 1.0,
                              width: 1.0,
                              margin: const EdgeInsets.all(1.0),
                              decoration: BoxDecoration(
                                color: kDarkGreyFontColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "assets/icons/étoile.png",
                              height: 35.0,
                              width: 35.0,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "XXX.XXX",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: kLightFontColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              "Aimes",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: kDarkGreyFontColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: List.generate(
                            12,
                            (index) => Container(
                              height: 1.0,
                              width: 1.0,
                              margin: const EdgeInsets.all(1.0),
                              decoration: BoxDecoration(
                                color: kDarkGreyFontColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "assets/icons/feu.png",
                              height: 35.0,
                              width: 35.0,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Niveaau ${widget.lvl} ",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: kLightFontColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              "Recette",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: kDarkGreyFontColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32.0,
                    ),

                    //     BAR INSTRUCTION INGREDIENTS 


                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15.0),
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      decoration: BoxDecoration(
                          color: kDarkColor,
                          borderRadius: BorderRadius.circular(32.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          tabs.length,
                          (index) => GestureDetector(
                            onTap: () => setState(() {
                              selectedIndex = index;
                            }),
                            child: Container(
                              height: 48.0,
                              width: 160,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: selectedIndex == index
                                      ? kLightgreyColor
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(32.0)),
                              child: Text(
                                tabs[index],
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: selectedIndex == index
                                        ? kPrimaryColor
                                        : kDarkGreyFontColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    //    I    N     G    R   E    D   I   E   N   T  S
                    SizedBox(
                      height: 32.0,
                    ),
                    selectedIndex == 0 ? Container(
                            alignment: Alignment.center,
                            height: 170.0,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 16.0,
                            ),
                            decoration: BoxDecoration(
                                color: kDarkColor,
                                borderRadius: BorderRadius.circular(24.0)),
                            child: SingleChildScrollView(
                              child: Text(
                                detail,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: kDarkGreyFontColor,
                                ),
                              ),
                            ),
                            
                          )
                          // chengeement d'indicateur instruction ou ingrediant
                        : Container(
                          height: 170.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: ingrediantList.length,
                            itemBuilder: (context, index) { 
                              return Container(
                              height: 170.0,
                              width: 100.0,
                              margin: const EdgeInsets.symmetric(horizontal:16),
                              decoration: BoxDecoration(
                                  color: kDarkColor,
                                  borderRadius: BorderRadius.circular(32.0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/frite.png",
                                    height: 70,
                                    width: 70,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(height: 12.0,),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      "Frite",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        color: kLightgreyfontColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          
                          ),
                        ),

                    SizedBox(
                      height: 24.0,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.keyboard_arrow_up,
                          size: 28.0,
                          color: kDarkGreyFontColor,
                        ),
                        Text(
                          "Voir Plus",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: kDarkGreyFontColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
