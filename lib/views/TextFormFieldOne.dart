import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldOne extends StatelessWidget{

  TextEditingController controller;
  String hintText = "";
  TextInputType keyboardType = TextInputType.text;
  bool obsureText;
  Function validator;
  Function onChanged;
  int maxLines;
  TextCapitalization textCapitalization;
  List<TextInputFormatter> inputFormatter;
  Widget iconView;
  bool hasFocus;
  bool enabled;
  FocusNode focusNode;
  String initialData;
  TextFormFieldOne({this.hintText, this.keyboardType = TextInputType.text, this.textCapitalization = TextCapitalization.none, this.obsureText = false, this.validator, this.onChanged, this.controller, this.inputFormatter,this.focusNode, this.maxLines = 1, this.iconView, this.initialData, this.enabled = true});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      enabled: enabled,
      onChanged: onChanged,
      decoration:new InputDecoration(
          fillColor: Color(0x22ffffff),
          prefixIcon: iconView,
          filled: true,
          contentPadding: new EdgeInsets.fromLTRB(40.0, 20.0, 10.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              fontFamily: 'Quicksand'
          )),
      validator: validator,
      initialValue: initialData,
      onEditingComplete: () =>
          FocusScope.of(context).nextFocus(),
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      textCapitalization: textCapitalization,
      focusNode: focusNode,
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
          fontFamily: 'Quicksand'
      ),
      obscureText: obsureText,
      inputFormatters: inputFormatter,
      maxLines: maxLines,
      controller: controller,

    );
  }
}