import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gardenfth/Constants/authConst.dart';
import 'package:gardenfth/UI/mainScreen/mainsc.dart';
import '../mainScreen/mainsc.dart';
import 'package:gardenfth/UI/profile/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gardenfth/UI/cart/pay.dart';

final List<String> entries = <String>['Chicken', 'Meat', 'Pork'];
final List<double> price = <double>[600, 500, 100];
final List<double> quantity = <double>[2, 3, 1];
final List<String> image_url = <String>['https://5.imimg.com/data5/WG/OW/MY-35471420/tandoori-chicken-meat-500x500.jpg',
                                          'https://www.purina.com/sites/g/files/auxxlc196/files/styles/facebook_share/public/purina-can-dogs-eat-real-meat-500x300.jpg?itok=IJ3xiqyx',
                                          'https://www.pork.org/wp-content/uploads/2017/10/raw-bacon-cured-TOPIC.jpg',];
final String total = '500';
class cart extends StatefulWidget {

  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery. of(context). size. width;
    double height = MediaQuery. of(context). size. height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white24,
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search,), onPressed: () {},),
          IconButton(icon: Icon(Icons.add_shopping_cart,), onPressed: () {},),
        ],),
      drawer: Container(
        color: Colors.white,
        width: screenWidth/2,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.solidUserCircle,
                  size: 70,
                  color: Colors.red[100],
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(builder: (context) => Profile()),
                  );
                },
              ),
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(builder: (context) => HomePage(auth: null,)),
                  );
                },
                child: Row(
                  children: <Widget>[
                    CircleAvatar(radius: 15,backgroundColor: Colors.red[100],child: Icon(Icons.home,color: Colors.redAccent,),),
                    SizedBox(width: 10,),
                    Text('Home',style: TextStyle(fontSize: 15,fontFamily: 'SF-Pro'),)
                  ],
                ),
              ),
            ),
            Divider(thickness: 0.5,height: 10,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(builder: (context) => cart()),
                  );
                },
                child: Row(
                  children: <Widget>[
                    CircleAvatar(radius: 15,backgroundColor: Colors.red[100],child: Icon(Icons.local_grocery_store,color: Colors.redAccent,),),
                    SizedBox(width: 10,),
                    Text('My Cart',style: TextStyle(fontSize: 15,fontFamily: 'SF-Pro'),)
                  ],
                ),
              ),
            ),
            Divider(thickness: 0.5,height: 10,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: (){},
                child: Row(
                  children: <Widget>[
                    CircleAvatar(radius: 15,backgroundColor: Colors.red[100],child: Icon(Icons.call,color: Colors.redAccent,),),
                    SizedBox(width: 10,),
                    Text('Contact Us',style: TextStyle(fontSize: 15,fontFamily: 'SF-Pro'),)
                  ],
                ),
              ),
            ),
            Divider(thickness: 0.5,height: 10,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: (){},
                child: Row(
                  children: <Widget>[
                    CircleAvatar(radius: 15,backgroundColor: Colors.red[100],child: Icon(Icons.attach_money,color: Colors.redAccent,),),
                    SizedBox(width: 10,),
                    Text('Earn Rewards',style: TextStyle(fontSize: 15,fontFamily: 'SF-Pro'),)
                  ],
                ),
              ),
            ),
            Divider(thickness: 0.5,height: 10,),

          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          topbar(context),
//          cards(context),
          Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: height/1.55,
                  child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(10, 10, 13, 10),
                      scrollDirection: Axis.vertical,
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 10,),
                                Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20.0, bottom: 20.0, left: 20, right: 10.0),
                                      child: Center(
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                child: ClipRRect(borderRadius: BorderRadius.circular(10),
                                                  child: Image.network('${image_url[index]}'),),
                                                height: 50,
                                                width: 70,
                                              ),
                                              SizedBox(width: 10,),
                                              Container(
                                                child: Column(
                                                  children: <Widget>[
                                                    Text(
                                                      '${entries[index]}',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                          fontFamily: 'SFPROBOLD'
                                                      ),
                                                    ),
                                                    SizedBox(height: 4),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Text('${price[index]}'),
                                                        Text(' x ${quantity[index]}',),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                             Spacer(),
                                              GestureDetector(
                                                onTap: (){},
                                                child: Text('Delete', style: TextStyle(color: Colors.red),),
                                              )
                                            ],
                                          )
                                      ),
                                    )
                                ),
                              ],
                            ));
                      }
                  ),
                ),
              )
            ],
          ),
          lowerHalf(context)

        ],
      ),
    );
  }
}

@override
Widget topbar(BuildContext context){
  return
     Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 40,),
          Text(
            'Cart',
            style: title,
          )
        ],
      ),
    );
}


//Widget cards(BuildContext context) {
//  return Padding(
//    padding: const EdgeInsets.only(top:170),
//    child: ListView.builder(padding: const EdgeInsets.fromLTRB(10, 10, 13, 10),
//            itemCount: entries.length,
//            itemBuilder: (BuildContext context, int index) {
//              return Container(
//                  child: Column(
//                    children: <Widget>[
//                      SizedBox(height: 10,),
//                      Card(
//                          shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.circular(10),
//                          ),
//                          elevation: 5,
//                          child: Padding(
//                            padding: const EdgeInsets.only(
//                                top: 20.0, bottom: 20.0, left: 20, right: 10.0),
//                            child: Center(
//                                child: Row(
//                                  children: <Widget>[
//                                    Container(
//                                      child: ClipRRect(borderRadius: BorderRadius.circular(10),
//                                      child: Image.network('${image_url[index]}'),),
//                                      height: 50,
//                                      width: 70,
//                                    ),
//                                    SizedBox(width: 10,),
//                                    Container(
//                                      child: Column(
//                                        children: <Widget>[
//                                          Text(
//                                            '${entries[index]}',
//                                            style: TextStyle(
//                                              fontSize: 20,
//                                              fontWeight: FontWeight.bold,
//                                              fontFamily: 'SFPROBOLD'
//                                            ),
//                                          ),
//                                          SizedBox(height: 4),
//                                          Row(
//                                            mainAxisAlignment: MainAxisAlignment.center,
//                                            children: <Widget>[
//                                              Text('${price[index]}'),
//                                              Text(' x ${quantity[index]}',),
//                                            ],
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                    SizedBox(width: 140,),
//                                    GestureDetector(
//                                      onTap: (){},
//                                      child: Text('Delete', style: TextStyle(color: Colors.red),),
//                                    )
//                                  ],
//                                )
//                            ),
//                          )
//                      ),
//                    ],
//                  ));
//            }
//        ),
//  );
//}

Widget lowerHalf(BuildContext context) {
  return  Container(
            height: 100,
            width: 450,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left:30.0),
                child: Row(
                  children: <Widget>[
                    Text('Total:  ${total}',style: TextStyle(color: Colors.white, fontSize: 20),),
                    Spacer(),
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(builder: (context) => Pay()),
                        );
                      },
                      child: Row(
                      children: <Widget>[
                        Text('Pay',style: TextStyle(color: Colors.white,fontSize: 20),),
                        Icon(Icons.navigate_next,color: Colors.white,size: 30,)
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
              color: Colors.black,
            ),
    );
}

