//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:gardenfth/UI/auth/number.dart';
//import 'package:gardenfth/UI/mainScreen/mainsc.dart';
//
//class AuthService{
//  handleAuth(){
//    return StreamBuilder(
//      stream: FirebaseAuth.instance.onAuthStateChanged,
//      builder: (BuildContext context, snapshot){
//        if(snapshot.hasData){
//          return HomePage();
//        }
//        else {
//          return Number();
//        }
//      }
//    );
//  }
//  signOut(){
//    FirebaseAuth.instance.signOut();
//  }
//}