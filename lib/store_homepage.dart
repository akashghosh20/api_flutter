import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StoreHomePage extends StatelessWidget {
  const StoreHomePage({Key? key}) : super(key: key);

  Future getProducts() async {
    final productUrl = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(productUrl);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Integration"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                    child:
                        ListTile(title: Text(snapshot.data[index]['title'])));
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
