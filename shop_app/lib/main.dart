import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/productoverview.dart';
import 'package:shop_app/screens/productdetails.dart';
import './providers/products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (ctx)=> Products(),

      child: MaterialApp(

      title: 'MyShop',
      theme: ThemeData(
          primarySwatch: Colors.purple,
              accentColor: Colors.red,
        fontFamily: 'Lato',
      ),
      home: Productoverview(),
      routes: {
        Productdetails.routename:(ctx)=>Productdetails(),

      }
    ),
    );
  }
}

