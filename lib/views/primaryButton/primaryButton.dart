
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class PrimaryButton extends StatelessWidget {

  final Function onTap;
  final String text;

  PrimaryButton({this.onTap, this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 48,
        padding: EdgeInsets.only(top: 14.0),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: new BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0xff055334).withOpacity(0.14),
              spreadRadius: 9,
              blurRadius: 20,
              offset: Offset(0, 11),
            ),
          ],
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.w500),
        ),
      ),
      onTap: onTap,
    );
  }
}