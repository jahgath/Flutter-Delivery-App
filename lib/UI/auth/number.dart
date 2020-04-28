
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gardenfth/Constants/authConst.dart';
import 'package:gardenfth/Services/Auth.dart';
import 'package:gardenfth/UI/auth/verify.dart';
import 'verify.dart';
import 'Email_signup.dart';
import 'package:gardenfth/Services/Auth.dart';

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NumberPage(),
    );
  }
}

class NumberPage extends StatefulWidget {

  NumberPage({this.auth});
  final AuthBase auth;

  @override
  _NumberPageState createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {

  final TextEditingController _numbercontroller = TextEditingController();

  String get _number => _numbercontroller.text;



  void _send()async
  {
//    await widget.auth.signInwithPhone(_number,,);
    print(_numbercontroller.toString());
  }


  Future<void> _submitPhoneNumber() async {
    /// NOTE: Either append your phone number country code or add in the code itself
    /// Since I'm in India we use "+91 " as prefix `phoneNumber`
    String phoneNumber = "+91 " + _numbercontroller.text.toString().trim();
    print(phoneNumber);
  }
    /// The below functions are the callbacks, separated so as to make code more redable
    void verificationCompleted(AuthCredential phoneAuthCredential) {
      print('verificationCompleted');
//      this._phoneAuthCredential = phoneAuthCredential;
      print(phoneAuthCredential);
    }

    void verificationFailed(AuthException error) {
      print(error);
    }

    void codeSent(String verificationId, [int code]) {
      print('codeSent');
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print('codeAutoRetrievalTimeout');
    }

  double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },),
        title: Text('Add number'),
        backgroundColor: Colors.redAccent,

      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 30.0, left: 20, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("What's your number", style: heading_auth),
                      ),
                      SizedBox(height: 4,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(" Enter mobile number to continue",
                            style: heading_auth_smol_1),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _numbercontroller,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Your mobile number",
                          hintText: "Enter your number",
                          icon: Icon(
                            Icons.phone,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Container(),
                          ),
                          FlatButton(
                            child: Text("Send"),
                            color: Colors.redAccent[100],
                            textColor: Colors.white,
                            padding: EdgeInsets.only(
                                left: 38, right: 38, top: 15, bottom: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            onPressed: _send,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }


}