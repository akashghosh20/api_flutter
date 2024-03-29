import 'dart:convert';
import 'package:http/http.dart' as http;

class productServices {
  Future getProducts() async {
    final productUrl = Uri.parse("http://localhost:5000/products");
    final response = await http.get(productUrl);
    return json.decode(response.body);
  }

  Future getSingleProducts(int id) async {
    final productUrl = Uri.parse("https://fakestoreapi.com/products/$id");
    final response = await http.get(productUrl);
    return json.decode(response.body);
  }
}
