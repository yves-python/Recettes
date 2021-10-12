// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recette/Screen/DetailScreen.dart';
import 'package:recette/constant.dart';
import 'package:http/http.dart' as https;

class Categories {
  String? imagesCategori;
  String? nomCategorie;

  Categories({this.imagesCategori, this.nomCategorie});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  int currentIndex = 0;
  List<Categories> categorieList = [
    
  ];
  List dinnerList = [
    {
      "image": "assets/images/dinner1.png",
      "name": "Dinner1",
      "time": "10",
      "lvl": "Simple",
    },
    {
      "image": "assets/images/dinner2.png",
      "name": "Dinner2",
      "time": "25",
      "lvl": "Fcl",
    },
    {
      "image": "assets/images/dinner3.png",
      "name": "Dinner3",
      "time": "40",
      "lvl": "Moyen",
    },
    {
      "image": "assets/images/dinner4.png",
      "name": "Dinner4",
      "time": "80",
      "lvl": "Dfcl",
    },
  ];
  void funct() async {
    try {
      var url = Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/categories.php'); // initialisation de la variable avec le lurl de l'Api
      var lienApi = await https.get(url); // RECUPERATION DU LIEN

      if (lienApi.statusCode == 200) {
        var reponse = jsonDecode(lienApi.body); // decodage de la reponse
        print(reponse["categories"].length);
        setState(
          () {
            categorieList = List.generate(
              reponse["categories"].length,
              (index) {
                return Categories(
                  nomCategorie: reponse["categories"][index]["strCategory"],
                  imagesCategori: reponse["categories"][index]["strCategoryThumb"].replaceAll(RegExp(r'\\'),'')
                );
              },
            );
          },
        );
      } else {
        print(lienApi.statusCode);
      }
    } catch (e) {
      print("--------------------------------------");
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    funct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      bottomNavigationBar: Container(
        height: 74.0,
        // padding: const EdgeInsets.only(top: 5),
        child: BottomNavigationBar(
            backgroundColor: kBottomColor.withOpacity(.1),
            type: BottomNavigationBarType.fixed,
            elevation: 0.0,
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: kDarkGreyFontColor,
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              BuildBottomNavigationBarItem('assets/icons/acceuil.png', 0),
              BuildBottomNavigationBarItem('assets/icons/recherche.png', 1),
              BuildBottomNavigationBarItem('assets/icons/menu.png', 2),
              BuildBottomNavigationBarItem('assets/icons/paramètres.png', 3),
            ]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 64.0, bottom: 32.0, left: 32.0, right: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: "Hi Yves",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            color: kLightFontColor),
                      ),
                      TextSpan(
                        text: "\nPres Pour Deguster Le Diner",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: kDarkGreyFontColor),
                      ),
                    ]),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: Stack(clipBehavior: Clip.none, children: [
                      Image.asset(
                        "assets/images/avatar1.png",
                        height: 60,
                        width: 60,
                      ),
                      Positioned(
                        top: -8.0,
                        right: -4.0,
                        child: Container(
                          height: 17.0,
                          width: 17.0,
                          decoration: BoxDecoration(
                            color: kRedColor,
                            borderRadius: BorderRadius.circular(17.0),
                            border:
                                Border.all(width: 1.0, color: kLightFontColor),
                          ),
                        ),
                      )
                    ]),
                  )
                ],
              ),
            ),

            /// B  A  N  N  E  R
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32.0),
              height: 155.0,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 6.0,
                  color: kLightgreyColor,
                ),
                borderRadius: BorderRadius.circular(32.0),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(26.0),
                    child: Image.asset(
                      "assets/images/banner.jpg",
                      width: 320.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24.0, horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Menu Pour Dinner",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: kDarkGreyFontColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "Poulet Au Four",
                          style: TextStyle(
                            fontSize: 17.0,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 25.0,
                                  width: 25.0,
                                  margin: EdgeInsets.only(right: 8.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(6.0)),
                                  child: Image.asset(
                                    "assets/icons/temps.png",
                                    height: 20,
                                    width: 20,
                                    color: kDarkColor,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text(
                                  "30 min",
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            SizedBox(width: 12.0),
                            Row(
                              children: [
                                Container(
                                  height: 25.0,
                                  width: 25.0,
                                  margin: EdgeInsets.only(right: 8.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(6.0)),
                                  child: Image.asset(
                                    "assets/icons/feu1.png",
                                    height: 20,
                                    width: 20,
                                    color: kDarkColor,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text(
                                  "Niveau Fcl",
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //               C  A  T  E  G  O  R  I  E

            Padding(
              padding: const EdgeInsets.only(
                  left: 28.0, right: 28.0, top: 28.0, bottom: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categorie De Repa",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800,
                        color: kLightFontColor),
                  ),
                  Text(
                    "Tout Voir",
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w800,
                        color: kDarkGreyFontColor),
                  )
                ],
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Row(
                    children: List.generate(
                  categorieList.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: GestureDetector(
                      onTap: () => setState(() {
                        currentIndex = index;
                      }),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 12.0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? kPrimaryColor
                              : kLightgreyColor,
                          borderRadius: BorderRadius.circular(18.0),
                          border: Border.all(
                              width: 3.0,
                              color: currentIndex == index
                                  ? kAccentColor
                                  : kDarkgreyColor),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                right: 16.0,
                              ),
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? kAccentColor
                                      : kDarkgreyColor,
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Image.network ( 
                                categorieList[index].imagesCategori!,
                                height: 30,
                                width: 30,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text(
                                categorieList[index].nomCategorie!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: currentIndex == index
                                      ? kDarkColor
                                      : kLightgreyfontColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
              ),
            ),
            //                             M           E        A          L
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 85.0,
                  crossAxisSpacing: 15.0,
                ),
                itemCount: dinnerList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 65.0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                            index,
                            dinnerList[index]['image'],
                            dinnerList[index]['name'],
                            dinnerList[index]["time"],
                            dinnerList[index]["lvl"]),
                      ),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 200.0,
                          width: 170.0,
                          padding: const EdgeInsets.only(bottom: 20.0),
                          decoration: BoxDecoration(
                              color: kLightgreyColor,
                              borderRadius: BorderRadius.circular(37.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                dinnerList[index]['name'],
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                    color: kLightFontColor),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  5,
                                  (index) => Image.asset(
                                    "assets/icons/étoile.png",
                                    height: 15.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "${dinnerList[index]["time"]}\nMin",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                        color: kLightFontColor),
                                    textAlign: TextAlign.center,
                                  ),
                                  Column(
                                    children: List.generate(
                                      5,
                                      (index) => Container(
                                        height: 1.0,
                                        width: 1.0,
                                        margin: const EdgeInsets.all(1.0),
                                        decoration: BoxDecoration(
                                          color: kDarkGreyFontColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Niveau \n ${dinnerList[index]["lvl"]}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      color: kLightFontColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: -170.0,
                          bottom: 0.0,
                          left: 10.0,
                          right: 10.0,
                          child: Hero(
                            tag: "tag$index",
                            child: Image.asset(
                              dinnerList[index]['image'],
                              height: 100,
                              width: 100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem BuildBottomNavigationBarItem(
      String image, int index) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            ImageIcon(
              AssetImage(image),
              size: 21.0,
            ),
            Container(
              height: 8.0,
              width: 8.0,
              margin: EdgeInsets.only(top: 4.0),
              decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? kPrimaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(50)),
            )
          ],
        ),
      ),
      label: "",
    );
  }
}
