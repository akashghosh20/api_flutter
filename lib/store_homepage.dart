import 'dart:convert';
import 'dart:html';
import 'package:api_practice/services.dart';
import 'package:api_practice/ui.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StoreHomePage extends StatelessWidget {
  const StoreHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Integration"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: productServices().getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailsProduct(
                                  id: snapshot.data[index]['id'])));
                        },
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              snapshot.data[index]['image'],
                              fit: BoxFit.fitHeight,
                              height: 100,
                              width: 100,
                            )),
                        title: Text(
                          snapshot.data[index]['title'],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ElevatedButton(
                        child: Text("Bye"),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
