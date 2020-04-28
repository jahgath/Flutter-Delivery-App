import 'package:flutter/material.dart';

class Pay extends StatefulWidget {
  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery. of(context). size. width;
    double height = MediaQuery. of(context). size. height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.only(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left:13,top:13,right: 13),
              child: Text(
                'Checkout',
                style: TextStyle(
                    fontFamily: 'SF-Pro',
                    fontWeight: FontWeight.w800,
                    fontSize: 34,
                    letterSpacing: 0),
              ),
            ),
            SizedBox(height: height/30,),
            Padding(
              padding: EdgeInsets.only(left:13,right: 13),
              child: Row(
                children: <Widget>[
                  Text(
                    'Total:',
                    style: TextStyle(
                        fontFamily: 'SF-Pro',
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left:13,right: 13),
                    child: Text(
                      'Rs 2000',
                      style: TextStyle(
                        fontFamily: 'SF-PRO',
                        fontWeight: FontWeight.w100,
                        fontSize: 45,
                        color: Colors.redAccent,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: height/25,),
            Padding(
              padding: EdgeInsets.only(left:13,right: 13),
              child: Text(
                'Address',
                style: TextStyle(
                    fontFamily: 'SF-Pro',
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[400]),
              ),
            ),
            SizedBox(height: height/110,),
            Padding(
              padding: EdgeInsets.only(left:13,right: 13),
              child: Text(
                'Xyc at Abc',
                style: TextStyle(
                    fontFamily: 'SF-Pro',
                    fontSize: 15,
                    color: Colors.grey[600]),
              ),
            ),
            SizedBox(height: height/30,),
            Padding(
              padding: EdgeInsets.only(left:13,right: 13),
              child: Text(
                'Payment Method',
                style: TextStyle(
                    fontFamily: 'SF-Pro',
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[400]),
              ),
            ),
            Spacer(),
        Container(
          height: height/10,
          width: 450,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: (){
                    },
                    child: Row(
                      children: <Widget>[
                        Text('Pay now',style: TextStyle(fontFamily:'SF-PRO',letterSpacing:1,color: Colors.white,fontSize: height/30),),
//                        Icon(Icons.navigate_next,color: Colors.white,size: 30,)
                      ],
                    ),)

                ],
              ),
            ),
            elevation: 10,
            margin: EdgeInsets.only(bottom: 0,left: 0,right: 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
              ),
            ),
            color: Colors.redAccent,
          ),
        )
          ],
        ),
      ),
    );
  }
}
