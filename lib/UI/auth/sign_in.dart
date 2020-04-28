import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gardenfth/Services/Auth.dart';
import 'package:gardenfth/UI/auth/Email_signin.dart';
import 'package:gardenfth/UI/auth/number.dart';
import 'Email_signup.dart';
import 'package:http/http.dart' as http;


class ChooseSign extends StatelessWidget {

  ChooseSign({@required this.auth});
  final AuthBase auth;

  Future<void> _signInAnon() async {
    try {
      await auth.signInAnon();
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      String token;
      user.getIdToken().then((result) {
        token = result.token;
        print('${token} is gay ');
      });

    } catch (e) {
      print(e.toString());
    }
  }


    Future<void> _signInWGoogle() async {
    try {
      await auth.signInWithGoogle();
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      String token;
      user.getIdToken().then((result) {
        token = result.token;
        print('${token} is gay ');
      });
    } catch (e) {
      print(e.toString());
    }
  }

//  void verifyToken(String token) {
//    var url = "<url to backend api>";
//    var client = http.Client();
//    var request = http.Request('POST', Uri.parse(url));
//    var body = {'id_token': token};
//    request.bodyFields = body;
//    var future = client.send(request).then((response) {
//      response.stream.bytesToString().then((value) {
//        print(value.toString());
//      }).catchError((error) {
//        print(error.toString());
//      });
//    });


    void _signInWEmail(BuildContext context) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => EmailSignIn(auth: auth,),
        ),
      );
    }

    void _signUpWEmail(BuildContext context) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => SignUpPage(auth: auth,),
        ),
      );
    }

      void _signupWphone(BuildContext context) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => Number(),
        ),
      );
    }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.redAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Welcome',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Text(
                    ' to',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Text(
                    ' Garden',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                elevation: 10,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9)),
                onPressed: () => _signInWEmail(context),
                child: Text('SIGN IN',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.redAccent,
                    )),
              ),
              RaisedButton(
                elevation: 10,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9)),
                onPressed: _signInWGoogle,
                child: Text('SIGN IN WITH GOOGLE',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.redAccent,
                    )),
              ),
              RaisedButton(
                elevation: 10,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9)),
                onPressed: () => _signupWphone(context),
                child: Text('SIGN UP WITH NUMBER',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.redAccent,
                    )),
              ),
              RaisedButton(
                elevation: 10,
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9)),
                onPressed: _signInAnon,
                child: Text('GO ANON',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    )),
              ),
              FlatButton(
                color: Colors.redAccent,
                onPressed: () => _signUpWEmail(context),
                child: Text('SIGN UP',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        ),
      );
    }
  }

