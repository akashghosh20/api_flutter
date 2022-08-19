// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:api_practice/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailsProduct extends StatefulWidget {
  int id;

  DetailsProduct({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailsProduct> createState() => _DetailsProductState();
}

class _DetailsProductState extends State<DetailsProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Single Details"),
      ),
      body: FutureBuilder(
        future: productServices().getSingleProducts(id),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Image.network(snapshot.data['image']);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
