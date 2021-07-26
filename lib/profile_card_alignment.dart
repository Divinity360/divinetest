import 'package:flutter/material.dart';
import 'package:tinder_cards/card_flip_page.dart' as flip;

class ProfileCardAlignment extends StatelessWidget {
  final int cardNum;

  ProfileCardAlignment(this.cardNum);

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "card$cardNum",
        child: Material(
            child: InkWell(
            child: Image.asset('res/dazed.png', fit: BoxFit.cover),
            onTap: () {
              Navigator.of(context).push(PageRouteBuilder(
                  transitionDuration: Duration(seconds: 1),
                  reverseTransitionDuration: Duration(seconds: 1),
                  pageBuilder: (_, __, ___) => flip.CardFlipPage(cardNum)));
            })));
  }
}
