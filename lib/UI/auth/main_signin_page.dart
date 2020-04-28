import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChooseSign extends StatefulWidget {
  @override
  _ChooseSignState createState() => _ChooseSignState();
}

class _ChooseSignState extends State<ChooseSign> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery. of(context). size. width;
    double screenheight = MediaQuery. of(context). size. height;
    return Scaffold(
      backgroundColor: Colors.red[400],
      body: Padding(
        padding: EdgeInsets.only(top:30,left:30,right:30,bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: screenheight/25),
                child: Text('Sign In',style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: 'SF-Pro',fontWeight: FontWeight.w700,letterSpacing: 1),),
              ),
            ),
               Padding(
                padding: EdgeInsets.only(top: screenheight/18),
                child: Text('Email',style: TextStyle(color: Colors.white,fontFamily: 'SF-Pro',fontSize: 15,letterSpacing: 1,fontWeight: FontWeight.w400),),
              ),
            Padding(
              padding: EdgeInsets.only(top: screenheight/50),
              child: Container(
                height: screenheight/11,
                width: screenWidth,
                child: Card(
                  color: Colors.redAccent,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      cursorColor: Colors.red[100],
                      decoration: InputDecoration(
                        hintText: " Enter your Email",
                        hintStyle: TextStyle(color: Colors.red[100]),
                        icon: Icon(Icons.mail,color: Colors.white70,),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenheight/25),
              child: Text('Password',style: TextStyle(color: Colors.white,fontFamily: 'SF-Pro',fontSize: 15,letterSpacing: 1,fontWeight: FontWeight.w400),),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenheight/50),
              child: Container(
                height: screenheight/11,
                width: screenWidth,
                child: Card(
                  color: Colors.redAccent,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      cursorColor: Colors.red[100],
                      decoration: InputDecoration(
                        hintText: " Enter your Password",
                        hintStyle: TextStyle(color: Colors.red[100]),
                        icon: Icon(Icons.lock,color: Colors.white70,),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(top: screenheight/35),
                child: Text('Forgot Password?',style: TextStyle(color: Colors.white,fontFamily: 'SF-Pro',fontSize: 13,letterSpacing: 1,fontWeight: FontWeight.w400),),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: screenheight/18),
                child: ButtonTheme(
                  minWidth: screenWidth,
                  height: screenheight/12,
                  child: RaisedButton(
                    elevation: 8,
                    onPressed: (){},
                    color: Colors.white,
                    child: Text('LOGIN',style: TextStyle(color: Colors.red[700],letterSpacing: 1,fontFamily: 'SF-Pro',fontSize: 18),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: screenheight/30),
                child: Text('- OR -',style: TextStyle(color: Colors.white70,fontFamily: 'SF-Pro'),),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: screenheight/30),
                child: Text('Sign in with',style: TextStyle(color: Colors.white,fontFamily: 'SF-Pro',letterSpacing: 0.5),),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: screenheight/30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme(
                      height: 60,
                      minWidth: 40,
                      child: RaisedButton(
                        color: Colors.white,
                        elevation: 10,
                        onPressed: (){},
                        child: FaIcon(FontAwesomeIcons.phone,size: 30,color: Colors.red[400],),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                    SizedBox(width: 50,),
                    ButtonTheme(
                      height: 60,
                      minWidth: 40,
                      child: RaisedButton(
                        color: Colors.white,
                        elevation: 10,
                        onPressed: (){},
                        child: FaIcon(FontAwesomeIcons.google,size: 30,color: Colors.red[400],),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
