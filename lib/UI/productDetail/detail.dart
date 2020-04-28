import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gardenfth/Services/product_model.dart';

class Detail extends StatefulWidget {

  final Products product;

  Detail(this.product);


  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    Widget _buildWidget() {
      try {
        return Image.network('${widget.product.imageUrl}');
      } catch (e) {
        print('enter catch exception start');
        print(e);
        print('enter catch exception end');
        return Container();
      }
    }

    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                  width: width / 2,
                  height: height / 3,
                  child: Container(child:Text('hi'))//TODO : try to get the image
              ),
            ),
            Center(
              child: Container(
                color: Colors.grey[300],
                width: 40,
                height: 23,
                child: Center(child: Text('1KG', style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[700]),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(widget.product.price, style: TextStyle(
                    fontFamily: 'SF-Pro',
                    fontWeight: FontWeight.bold,
                    fontSize: 25),),
              ),
            ),
            Center(
              child: Text(widget.product.item, style: TextStyle(
                  fontFamily: 'SF-Pro',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey[600]),),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(widget.product.description, style: TextStyle(
                  fontFamily: 'SF-Pro',
                  fontSize: 15,
                  color: Colors.grey[500]),),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text('Quantity', style: TextStyle(fontFamily: 'SF-Pro',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey[500]),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlineButton(
                    onPressed: () {},
                    borderSide: BorderSide(width: 2, color: Colors.grey[400]),
                    child: FaIcon(
                      FontAwesomeIcons.minus,
                      size: 20.0,
                      color: Colors.grey[400],
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                  Text('1000g', style: TextStyle(fontFamily: 'SF-Pro',
                      fontWeight: FontWeight.bold,
                      fontSize: 30),),
                  OutlineButton(
                    onPressed: () {},
                    borderSide: BorderSide(width: 2, color: Colors.grey[400]),
                    child: FaIcon(
                      FontAwesomeIcons.plus,
                      size: 20.0,
                      color: Colors.grey[400],
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            FlatButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Text('ADD TO CART',
                style: TextStyle(fontFamily: 'SF-Pro', color: Colors.white),),
              color: Colors.redAccent,
            )
          ],
        ),
      ),
    );
  }
}
