import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gardenfth/Services/Auth.dart';
import 'package:gardenfth/UI/cart/cart.dart';
import '../cart/cart.dart';
import 'package:gardenfth/UI/profile/profile.dart';
import '../../Constants/authConst.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gardenfth/Services/network.dart';
import 'package:gardenfth/UI/productDetail/detail.dart';
import 'search.dart';
import 'package:gardenfth/UI/mainScreen/categories.dart' as cat;

final List<String> categories = <String>['Chicken', 'Beef', 'Pork', 'Fish'];
List colors = [
  Colors.redAccent[100],
  Colors.blueAccent[100],
  Colors.orange[200],
  Colors.pink[100]
];

//for the carousel
final List<String> imgList = [
  'https://ak8.picdn.net/shutterstock/videos/1018553728/thumb/1.jpg',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
//                child: Text(
//                  'No. ${imgList.indexOf(item)} image',
//                  style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 20.0,
//                    fontWeight: FontWeight.bold,
//                  ),
//                ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

int _current = 0;
//carousel data

class HomePage extends StatefulWidget {
  HomePage({@required this.auth});

  final AuthBase auth;

  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool isWaiting = false;
  Map<String, String> coinValues = {};

  void getData() async {
    isWaiting = true;
    try {
      var data = await getData();
      isWaiting = false;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  List<bool> _likes = List.filled(entries.length, true);

  Future<void> _signOut() async {
    try {
      await widget.auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  TabController _tabController;

//  @override
//  void initState() {
//    super.initState();
//
//  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool _selectedIndex = false;

  _onSelected() {
    setState(() => _selectedIndex = true);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery. of(context). size. width;
    Widget createPopularListview(BuildContext context, AsyncSnapshot snapshot) {
      return Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 230,
              child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        width: 170,
                        height: 100,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 5,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                        bottom: 30,
                                        right: 10),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            child: Image.network(
                                                "${snapshot.data[index+2].imageUrl}"),
                                          ),
                                          height: 100,
                                          width: 130,
                                        ),
                                        Text(
                                          '${snapshot.data[index].item}',style: heading_auth_smol_2
                                        ),
                                        Text(
                                            '${snapshot.data[index].price}',style: heading_auth_smol_1,)
                                      ],
                                    ),
                                  )),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                      builder: (context) => Detail(snapshot.data[index])
                                  ),
                                );
                              },
                            )
                          ],
                        ));
                  }),
            ),
          )
        ],
      );
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Store'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (context) => Search()),
              );
            },
          ),
        ],
      ),
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: _signOut,
                child: Row(
                  children: <Widget>[
                    CircleAvatar(radius: 15,backgroundColor: Colors.red[100],child: Icon(Icons.exit_to_app,color: Colors.redAccent,),),
                    SizedBox(width: 10,),
                    Text('Logout',style: TextStyle(fontSize: 15,fontFamily: 'SF-Pro'),)
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
          Column(children: [
            CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: false,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(255, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.2),
                  ),
                );
              }).toList(),
            ),
          ]),
          Padding(
            child: Text(
              'Categories',
              style: TextStyle(
                  fontFamily: 'SF-Pro',
                  fontWeight: FontWeight.w800,
                  fontSize: 34,
                  letterSpacing: 0),
            ),
            padding: EdgeInsets.only(left: 15, top: 15),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              width: 100,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                        builder: (context) => cat.Category(
                                              catText: categories[index],
                                            )),
                                  );
                                },
                                child: Card(
                                  color: colors[index],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  elevation: 0,
                                  child: Center(
                                      child: Text(
                                    '${categories[index]}',
                                    style: TextStyle(
                                        fontFamily: 'SF-Pro',
                                        color: Colors.white,
                                        fontSize: 17),
                                  )),
                                ),
                              ));
                        }),
                  ),
                )
              ],
            ),
          ),
          Padding(
            child: Text(
              'Popular',
              style: TextStyle(
                  fontFamily: 'SF-Pro',
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[400]),
            ),
            padding: EdgeInsets.only(top: 30, left: 25),
          ),
          FutureBuilder(
            future: getProducts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text('LoADING!!!'),
                  ),
                );
              } else {
                return createPopularListview(context, snapshot);
              }
            },
          ),
          Padding(
            child: Text(
              'Sales',
              style: TextStyle(
                  fontFamily: 'SF-Pro',
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[400]),
            ),
            padding: EdgeInsets.only(left: 25),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: 230,
                  child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      scrollDirection: Axis.horizontal,
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            width: 170,
                            height: 100,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 5,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 10,
                                          left: 10,
                                          bottom: 10,
                                          right: 10),
                                      child: Column(
                                        children: <Widget>[
//                                          Row(
//                                            children: <Widget>[
//                                              Container(padding: EdgeInsets.all(3),child: Text('${quantity[index]}',style: TextStyle(color: Colors.grey[700]),),color: Colors.grey[400],),
//                                              SizedBox(width: 105,),
//                                              IconButton(splashColor: Colors.transparent,icon: _likes[index] ? Icon(Icons.favorite_border, color: Colors.grey,):Icon(Icons.favorite,color: Colors.red,) , onPressed: () {setState(() {
//                                                _likes[index] = !_likes[index];
//                                              });},)
//                                            ],
//                                          ),
                                          Container(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                  '${image_url[index]}'),
                                            ),
                                            height: 100,
                                            width: 130,
                                          ),
                                          Text(
                                            '${entries[index]}',
                                            style: heading_auth_smol_2,
                                          ),
                                          Text(
                                            '${price[index]}',
                                            style: heading_auth_smol_1,
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            ));
                      }),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

//  Widget Category(BuildContext context){
//    return Align(
//      alignment: Alignment.topCenter,
//      child: Container(
//        height: 150,
//        width: 500,
//        child: Card(
//          elevation: 10,
//          margin: EdgeInsets.only(top: 0),
//          child: Padding(
//            padding: EdgeInsets.all(20),
//            child: Column(
//              children: <Widget>[
//                Align(
//                    alignment:Alignment.centerLeft,
//                    child:Text(
//                      'All categories',
//                      style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),)),
//                SizedBox(height: 10,),
//                Row(
//                  children: <Widget>[
//                    Container(
//                      height: 70,
//                      width: 70,
//                      child: Card(
//                        color: Colors.red[100],
//                        shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.circular(50)
//                        ),
//                        child: Center(
//                          child: Icon(Icons.add, color: Colors.red[300],),
//                        ),
//                      ),
//                    )
//                  ],
//                )
//              ],
//            ),
//          ),
//          shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.only(
//                bottomLeft: Radius.circular(20),
//                bottomRight: Radius.circular(20)
//            ),
//          ),
//        ),
//      ),
//    );
//  }
}
//  Widget Tabs(BuildContext context){
//    return Scaffold(
//      body: TabBarView(
//        controller: _tabController,
//        children: myTabs.map((Tab tab) {
//          final String label = tab.text.toLowerCase();
//          return Center(
//            child: Text(
//              'This is the $label tab',
//              style: const TextStyle(fontSize: 36),
//            ),
//          );
//        }).toList(),
//      ),
//    );
//  }
