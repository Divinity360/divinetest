import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:tinder_cards/anim/FadeAnimation.dart';
import 'package:tinder_cards/signup.dart';
import 'package:tinder_cards/swipe_feed_page.dart';
import 'package:tinder_cards/util/Validator.dart';
import 'package:tinder_cards/views/TextFormFieldOne.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.only(top: 44.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.4),
          end: FractionalOffset(0.9, 0.7),
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.1, 0.9],
          colors: [Colors.black, Colors.black],
        )),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            FadeAnimation(
                0.3,
                Center(
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
                )),
            headlinesWidget(),
            emailTextFieldWidget(emailController),
            passwordTextFieldWidget(passwordController),
            loginButtonWidget(
                context, _formKey, _auth, emailController, passwordController),
            signupWidget(context)
          ],
        ),
      ),
    ));
  }

  Widget loginButtonWidget(
      BuildContext context,
      final formKey,
      final auth,
      TextEditingController emailcontroller,
      TextEditingController passcontroller) {
    return FadeAnimation(
        1.5,
        InkWell(
          onTap: () async {
            await submitLogin(formKey, auth, emailcontroller, passcontroller, context);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.circular(36.0),
            ),
            child: Center(
              child: loading ? CircularProgressIndicator(color: Colors.black,) : Text(
                'LOGIN',
                style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Quicksand'),
              ),
            ),
          ),
        ));
  }

  Future<void> submitLogin(formKey, auth, TextEditingController emailcontroller, TextEditingController passcontroller, BuildContext context) async {
       if (formKey.currentState.validate()) {
      setState(() => loading = true);
      try {
        AuthResult authResult = await auth.signInWithEmailAndPassword(
            email: emailcontroller.text, password: passcontroller.text);
        FirebaseUser newUser = authResult.user;
        if (newUser != null) {
          setState(() => loading = false);
          print(newUser.displayName);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SwipeFeedPage()));
        }
      } catch (e) {
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
  }
}

Widget signupWidget(BuildContext context) {
  return FadeAnimation(
      1.8,
      Container(
        margin: EdgeInsets.only(left: 48.0, top: 32.0),
        child: Row(
          children: <Widget>[
            Text(
              'Don\'t have an account?',
              style: TextStyle(fontFamily: 'Quicksand', color: Colors.white),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: Text(
                'Sign Up',
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
  return FadeAnimation(
      1.2,
      Container(
        height: 50,
        margin: EdgeInsets.only(left: 15.0, right: 15.0),
        child: TextFormFieldOne(
          hintText: "Password",
          controller: controller,
          validator: Validator.isEmptyValidator,
          iconView: Icon(
            Icons.lock,
            color: Colors.white,
            size: 17,
          ),
        ),
      ));
}

Widget emailTextFieldWidget(TextEditingController controller) {
  return FadeAnimation(
      0.9,
      Container(
        height: 50,
        margin: EdgeInsets.only(left: 15.0, right: 15.0),
        child: TextFormFieldOne(
          hintText: "Email",
          controller: controller,
          validator: Validator.emailValidator,
          iconView: Icon(
            Icons.email,
            color: Colors.white,
            size: 17,
          ),
        ),
      ));
}

Widget headlinesWidget() {
  return FadeAnimation(
      0.6,
      Container(
        margin: EdgeInsets.only(top: 74.0, bottom: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Log In',
              style: TextStyle(
                  letterSpacing: 3,
                  fontSize: 25.0,
                  color: Colors.white,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w200),
            ),
            Text(
              'to continue.',
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
