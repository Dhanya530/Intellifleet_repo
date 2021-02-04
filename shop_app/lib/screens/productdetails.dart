import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';


class Productdetails extends StatelessWidget {
  //final String title;
  //final double price;
  //Productdetails(this.title,this.price);
  static const routename='/Productdetails';

  @override
  Widget build(BuildContext context) {
    final productid=
    ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productid);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),


      ),
    );
  }}