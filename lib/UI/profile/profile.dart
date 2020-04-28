import 'package:flutter/material.dart';
import 'package:gardenfth/Constants/authConst.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery. of(context). size. width;
    double screenheight = MediaQuery. of(context). size. height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text('Profile'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage('https://kottke.org/plus/misc/images/ai-faces-01.jpg'),
            ),
            Padding(
              padding: EdgeInsets.only(top:screenheight/30),
              child: Text('Scarlett Jones',style: TextStyle(fontFamily: 'SF-PRO',fontWeight: FontWeight.bold,fontSize: screenheight/28),),
            ),
            Padding(
              padding: EdgeInsets.only(top:screenheight/60, bottom: screenheight/20),
              child: Text('sjones@gmail.com',style: TextStyle(fontSize: 15,fontFamily: 'SF-Pro',color: Colors.grey[500]),),
            ),
            Padding(
              padding: EdgeInsets.only(top:screenheight/40),
              child: Row(
                children: <Widget>[
                  Icon(Icons.location_on,color: Colors.grey[400],size: 30,),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('My Address',style: TextStyle(fontFamily: 'SF-Pro',fontSize: 15,fontWeight: FontWeight.w600,letterSpacing: 0.3),),
                  ),
                  Spacer(),
                  Icon(Icons.navigate_next,color: Colors.grey[400],size: 30,)
                ],
              )
            ),
            Divider(thickness: 0.5,),
            Padding(
                padding: EdgeInsets.only(top:screenheight/100,bottom: screenheight/100),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.people,color: Colors.grey[400],size: 30,),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Account',style: TextStyle(fontFamily: 'SF-Pro',fontSize: 15,fontWeight: FontWeight.w600,letterSpacing: 0.3),),
                    ),
                    Spacer(),
                    Icon(Icons.navigate_next,color: Colors.grey[400],size: 30,)
                  ],
                )
            ),
            Divider(thickness: 0.5,),
            Padding(
                padding: EdgeInsets.only(top:screenheight/100,bottom: screenheight/100),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.notifications,color: Colors.grey[400],size: 30,),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Notifications',style: TextStyle(fontFamily: 'SF-Pro',fontSize: 15,fontWeight: FontWeight.w600,letterSpacing: 0.3),),
                    ),
                    Spacer(),
                    Icon(Icons.navigate_next,color: Colors.grey[400],size: 30,)
                  ],
                )
            ),
            Divider(thickness: 0.5,),
            Padding(
                padding: EdgeInsets.only(top:screenheight/100,bottom: screenheight/100),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.phone_android,color: Colors.grey[400],size: 30,),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Devices',style: TextStyle(fontFamily: 'SF-Pro',fontSize: 15,fontWeight: FontWeight.w600,letterSpacing: 0.3),),
                    ),
                    Spacer(),
                    Icon(Icons.navigate_next,color: Colors.grey[400],size: 30,)
                  ],
                )
            ),
            Divider(thickness: 0.5,),
            Padding(
                padding: EdgeInsets.only(top:screenheight/100,bottom: screenheight/100),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.vpn_key,color: Colors.grey[400],size: 30,),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Passwords',style: TextStyle(fontFamily: 'SF-Pro',fontSize: 15,fontWeight: FontWeight.w600,letterSpacing: 0.3),),
                    ),
                    Spacer(),
                    Icon(Icons.navigate_next,color: Colors.grey[400],size: 30,)
                  ],
                )
            ),
          ],
        ),
      )
    );
  }
}
