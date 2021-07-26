import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:tinder_cards/anim/FadeAnimation.dart';
import 'package:tinder_cards/views/TextFormFieldOne.dart';
import 'cards_section_alignment.dart';

class SwipeFeedPage extends StatefulWidget {
  @override
  _SwipeFeedPageState createState() => _SwipeFeedPageState();
}

class _SwipeFeedPageState extends State<SwipeFeedPage> {
  bool showAlignmentCards = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  begin: FractionalOffset(1.0, 0.2),
                  end: FractionalOffset(1.0, 1.0),
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.5],
                  colors: [Colors.black, Colors.white],
                )),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                  0.3,
                  Padding(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Magaz',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 0.6,
                              fontSize: 27.0,
                              color: Colors.white,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w900),
                        ),
                        Icon(
                          Ionicons.md_qr_scanner,
                          color: Colors.white,
                        )
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FadeAnimation(
                    0.5,
                    Container(
                      height: 45,
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: TextFormFieldOne(
                        hintText: "",
                        iconView: Icon(
                          MaterialIcons.search,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    )),
                Container(
                  height: 30,
                ),
                Container(
                  height: 300,
                  child: CardsSectionAlignment(context),
                ),
                SizedBox(
                  height: 10,
                ),
                FadeAnimation(
                  0.8,
                  Padding(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'All Magazines',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 0.6,
                              fontSize: 13.0,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          MaterialCommunityIcons.arrow_right_circle,
                          color: Colors.black,
                          size: 22,
                        )
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
                FadeAnimation(
                  1.3,
                  Padding(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("res/portrait.jpeg", fit: BoxFit.cover, height: 50, width: 100,),
                        Image.asset("res/portrait.jpeg", fit: BoxFit.cover, height: 50, width: 100,),
                        Image.asset("res/portrait.jpeg", fit: BoxFit.cover, height: 50, width: 100,),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ],
            ),
          ) ,
        ) ,
        bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 1,
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(
                  Feather.home,
                  size: 21,
                  color: Colors.black,
                ),
                title: new Text(
                  "",
                  style: TextStyle(
                    fontSize: 1,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            new BottomNavigationBarItem(
              icon: new Icon(
                Feather.shopping_bag,
                size: 21,
                color: Colors.black,
              ),
              title: new Text("",
                  style: TextStyle(
                    fontSize: 1,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(
                Feather.message_circle,
                size: 21,
                color: Colors.black,
              ),
              title: new Text("",
                  style: TextStyle(
                    fontSize: 1,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(
                MaterialCommunityIcons.dots_horizontal_circle_outline,
                size: 23,
                color: Colors.black,
              ),
              title: new Text("",
                  style: TextStyle(
                    fontSize: 1,
                    fontWeight: FontWeight.w500,
                  )),
            )
          ],
          onTap: (i) {},
          currentIndex: 0,
        ));
  }

}
