import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:gardenfth/UI/auth/sign_in.dart';

import '../auth/sign_in.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => new _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final pageData = [
    {
      "name": "Get Started with Garden",
      "description":
      "All your poultry in one place"
    },
    {
      "name": "Track your delivery",
      "description":
      "Our deliveries will be fast but we ensure that it'll be trackable"
    },
    {
      "name": "Meh Meh",
      "description":
      "Meh Meh Meh Meh Meh Meh"
    }
  ];
  final images = [Image(image: AssetImage('assets/images/onboard1.jpg')),Image(image: AssetImage('assets/images/onboard2.jpg')),Image(image: AssetImage(''))];
  SwiperController _controller = SwiperController();
  var textHeading = "Get Started with Garden";
  var textDescr =  "All your poultry in one place";
  var showNext = true;
  @override
  void initState()
  {
    super.initState();
  }
  changeText(index) {

    setState(() {
      textHeading = pageData[index]["name"];
      textDescr = pageData[index]["description"];
      if(index == pageData.length-1)
        showNext = false;
      else
        showNext = true;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox.expand(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100,),
                  Container(
                      height: 400,
                      child: Swiper(
                        onIndexChanged: (int index) => changeText(index),
                        itemBuilder: (BuildContext context, int index) {
                          return images[index];
                        },
                        itemCount: pageData.length,
                        viewportFraction: 1.0,
                        scale: 0.7,
                        loop: false,
                        controller: _controller,
                        pagination: SwiperPagination(
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text('$textHeading',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold))),
                  Padding(
                      padding: EdgeInsets.only(left: 45, right: 45, top: 10),
                      child: Text('$textDescr',textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 15,
                              fontWeight: FontWeight.w400))),
//                  if (showNext) Padding(padding: EdgeInsets.only(top: 30),
//                      child: RaisedButton(
//                        textColor: Colors.amber,
//                        color: Colors.amber,
//                        shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(15.0),
//                        ),
//                        child: Padding(padding: EdgeInsets.symmetric(horizontal: 57),child: Text(
//                          'Next',
//                          style: TextStyle(
//                            fontSize: 25,
//                            fontWeight: FontWeight.bold,
//                            color: Colors.white,
//                          ),
//                        )),
//                        onPressed: () {
//                          _controller.next();
//                        },
//                      )),
//                  if (showNext) Padding(
//                      padding: EdgeInsets.only(top: 5),
//                      child: OutlineButton(
//                        borderSide: BorderSide(color: Colors.amber, width: 2),
//                        textColor: Colors.amber,
//                        color: Colors.white,
//                        shape: new RoundedRectangleBorder(
//                          borderRadius: new BorderRadius.circular(15.0),
//                        ),
//                        child: Padding(
//                            padding: EdgeInsets.symmetric(horizontal: 20),
//                            child: Text(
//                              'Get Started',
//                              style: TextStyle(
//                                  fontSize: 25,
//                                  fontWeight: FontWeight.bold
//                              ),
//                            )),
//                        onPressed: () {
//
//                        },
//                      )),
                  if (!showNext) Padding(padding: EdgeInsets.only(left: 10,top: 15),
                      child: OutlineButton(
                        borderSide: BorderSide(color: Colors.redAccent, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),),
                        child: Padding(padding: EdgeInsets.symmetric(horizontal: 0),child: Text(
                          'Get Started',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.redAccent,
                          ),
                        )),
                        onPressed: () {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                              builder: (context) => ChooseSign(),
//                            ),
//                          );
                        },
                      ))
                ])));
  }
}
