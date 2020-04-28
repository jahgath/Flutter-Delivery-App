import 'package:flutter/material.dart';
import 'package:gardenfth/Services/Auth.dart';
import 'package:gardenfth/UI/auth/sign_in.dart';
import 'package:gardenfth/UI/mainScreen/mainsc.dart';

class landingPage extends StatelessWidget {

  landingPage({@required this.auth});

  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return ChooseSign(auth: auth,
              );
            }
            return HomePage(auth: auth,
            ); //temp placeholder for homepage
          }
          else{
            return  Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                )
            );
          }
        }
    );
  }
}
