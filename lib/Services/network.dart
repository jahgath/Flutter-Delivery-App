import 'package:http/http.dart' as http;
import 'dart:convert';
import 'product_model.dart';

final String url = "http://52.66.248.105:8000/products/?format=json#";



Future<List<Products>> getProducts() async {
  var data = await http.get(
    Uri.encodeFull(url),headers: {"Accept":"application/json"}
  );

  if (data.statusCode == 200) {
    var jsonData = json.decode(data.body);
    List<Products> product = [];

    for (var i in jsonData) {
      Products pro = Products(i["id"], i["item"], i["category"],
          i["description"], i["imageUrl"], i["price"]);
      product.add(pro);
    }
    ;
    print(product.length);
    return product;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load ');
  }
}