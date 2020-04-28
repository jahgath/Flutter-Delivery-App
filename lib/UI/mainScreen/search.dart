import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gardenfth/Constants/authConst.dart';
import 'package:gardenfth/UI/productDetail/detail.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<AlgoliaObjectSnapshot> _results = [];
  bool _searching = false;
  bool _searched = false;

  _search() async {
    setState(() {
      _searching = true;
      _searched = true;
    });

    Algolia algolia = Algolia.init(
      applicationId: 'RKNYXNNP8H',
      apiKey: '96e3b7aef931f353efe6667fd748b9a4',
    );

    AlgoliaQuery query = algolia.instance.index('prod_NAME');
    query = query.search(_searchText.text);

    _results = (await query.getObjects()).hits;

    setState(() {
      _searching = false;
    });
  }

  TextEditingController _searchText = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        title: Text("Search",style: TextStyle(fontFamily: 'SF-Pro',fontSize: 28,fontWeight: FontWeight.w700,color: Colors.black),),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: _searchText,
                      decoration: InputDecoration(
                        hintText: "Search here",
                        icon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:4),
                      child: FlatButton(
                        child: Icon(Icons.check,color: Colors.green,),
                        onPressed: _search,
                      ),
                    ),
                  ],
                ),
              ],
            ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0,top: 14,right: 8,bottom: 8),
                  child: _searched == true
                  ? Text('${_results.length} Results for " ${_searchText.text}"',style: TextStyle(fontFamily: 'SF-PRO',color: Colors.grey,letterSpacing: 1),)
                  : null
                ),
            Expanded(
              child: _searching == true
                  ? Center(
                child: Text("Searching, please wait..."),
              )
                  : _results.length == 0
                  ? _searched ?Center(
                child: Text("No results found."),
              ):Text('')
                  : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _results.length,
                itemBuilder: (BuildContext ctx, int index) {
                  AlgoliaObjectSnapshot snap = _results[index];

                  return Container(
                      width: 170,
                      height: 100,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10,),
                          GestureDetector(
                            child:    Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10.0, left: 20, right: 10.0),
                                  child: Center(
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  snap.data["name"],
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: 'SFPROBOLD'
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(snap.data["price"],),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            child: ClipRRect(borderRadius: BorderRadius.circular(10),
                                              child: Image.network(snap.data["image_url"]),),
                                            height: 50,
                                            width: 70,
                                          ),
                                        ],
                                      )
                                  ),
                                )
                            ),
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                    builder: (context) => Detail(null)
                                ),
                              );
                            },
                          )
                        ],
                      )
                  );
                },
              ),
            ),
          ],
        ),
      ), 
    );
  }
  }
