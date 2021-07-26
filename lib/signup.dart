
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:tinder_cards/anim/FadeAnimation.dart';
import 'package:tinder_cards/login.dart';
import 'package:tinder_cards/swipe_feed_page.dart';
import 'package:tinder_cards/util/Validator.dart';
import 'package:tinder_cards/views/TextFormFieldOne.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final phoneController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child:  Container(
        padding: EdgeInsets.only(top: 44.0),
        decoration: BoxDecoration(gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.4), end: FractionalOffset(0.9, 0.7),
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.1, 0.9], colors: [Colors.black, Colors.black],
        )),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
          FadeAnimation(0.3, Center(
              child: Text(
                'Magaz',
                textAlign: TextAlign.left,
                style: TextStyle(
                    letterSpacing: 0.6,
                    fontSize: 27.0,
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w900),
              ),
            ),),
            headlinesWidget(),
            firstNameFieldWidget(firstNameController),
            lastNameFieldWidget(lastNameController),
            emailTextFieldWidget(emailController),
            phoneTextFieldWidget(phoneController),
            passwordTextFieldWidget(passwordController),
            loginButtonWidget(context, _formKey, _auth, firstNameController,lastNameController,emailController,phoneController,passwordController ),
            loginWidget(context)
          ],
        ),
      ),)
    );
  }

  Widget loginButtonWidget(BuildContext context, final formKey, final auth, TextEditingController firstcontroller, TextEditingController lastcontroller, TextEditingController emailcontroller, TextEditingController phonecontroller,TextEditingController passcontroller) {
    return FadeAnimation(2.4, InkWell(
      onTap: () async {
        if (formKey.currentState.validate()){
          try {
            setState(() => loading = true);
            AuthResult result = await auth.createUserWithEmailAndPassword(email: emailcontroller.text, password: passcontroller.text);
            print(result.runtimeType);
            FirebaseUser user = result.user;
            print(user.runtimeType);
            UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
            userUpdateInfo.displayName = firstcontroller.text + "," + lastcontroller.text;
            user.updateProfile(userUpdateInfo);
            user.reload();
            if (user != null) {
              setState(() => loading = false);
              print(user.toString());
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SwipeFeedPage()));
            }
          }  catch (e) {
            setState(() => loading = false);
            if (e.runtimeType == PlatformException) {
              if (e.message != null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(e.message),
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("An error occurred"),
                ));
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(e.toString()),
              ));
            }

          }
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(36.0),
        ),
        child: Center(child: loading ? CircularProgressIndicator(color: Colors.black,) : Text(
          'SIGN UP',
          style: TextStyle(
              color: Colors.black,
              letterSpacing: 1,
              fontSize: 17,
              fontWeight: FontWeight.w900,
              fontFamily: 'Quicksand'),
        ),) ,
      ),
    ));
  }
}

Widget loginWidget(BuildContext context) {
  return FadeAnimation(2.7,  Container(
    margin: EdgeInsets.only(left: 48.0, top: 12.0),
    child: Row(
      children: <Widget>[
        Text(
          'Already have an account?',
          style: TextStyle(fontFamily: 'Quicksand', color: Colors.white),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: Text(
            'Login',
            style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
                fontFamily: 'Quicksand'),
          ),
        )
      ],
    ),
  ));
}

Widget passwordTextFieldWidget(TextEditingController controller) {
  return FadeAnimation(2.1, Container(
    height: 50,
    margin: EdgeInsets.only(left: 15.0, right: 15.0),
    child: TextFormFieldOne(
      hintText: "Password",
      controller: controller,
      iconView: Icon(Icons.lock, color: Colors.white, size: 17,),
      obsureText: true,
      validator: Validator.isEmptyValidator,
    ),
  ));
}

Widget emailTextFieldWidget(TextEditingController controller) {
  return FadeAnimation(1.5, Container(
    height: 50,
    margin: EdgeInsets.only(left: 15.0, right: 15.0),
    child: TextFormFieldOne(
      hintText: "Email",
      controller: controller,
      iconView: Icon(Icons.email, color: Colors.white, size: 17,),
      validator: Validator.emailValidator,
    ),
  ));
}

Widget phoneTextFieldWidget(TextEditingController controller) {
  return FadeAnimation(1.8, Container(
    height: 50,
    margin: EdgeInsets.only(left: 15.0, right: 15.0),
    child: TextFormFieldOne(
      hintText: "Phone",
      iconView: Icon(Icons.phone, color: Colors.white, size: 17,),
      controller: controller,
      inputFormatter: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      validator: Validator.numberValidator,
      keyboardType: TextInputType.number,
    ),
  ));
}


Widget firstNameFieldWidget(TextEditingController nameController) {
  return FadeAnimation(0.9, Container(
    height: 50,
    margin: EdgeInsets.only(left: 15.0, right: 15.0),
    child: TextFormFieldOne(
      hintText: "First Name",
      controller: nameController,
      iconView: Icon(Icons.account_circle, color: Colors.white, size: 17,),
      validator: Validator.isEmptyValidator,
    ),
  ));
}


Widget lastNameFieldWidget(TextEditingController controller) {
  return FadeAnimation(1.2, Container(
    height: 50,
    margin: EdgeInsets.only(left: 15.0, right: 15.0),
    child: TextFormFieldOne(
      hintText: "Last Name",
      controller: controller,
      iconView: Icon(Icons.account_circle, color: Colors.white, size: 17,),
      validator: Validator.isEmptyValidator,
    ),
  ));
}

Widget headlinesWidget() {
  return FadeAnimation(0.6,  Container(
    margin: EdgeInsets.only(top: 24.0, bottom: 17),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Sign Up',
          style: TextStyle(
              letterSpacing: 3,
              fontSize: 25.0,
              color: Colors.white,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w200),
        ),
      ],
    ),
  ));
}


