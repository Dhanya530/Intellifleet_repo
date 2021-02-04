
import 'package:flutter/material.dart';
import 'package:shop_app/providers/products.dart';
import 'productitem.dart';
import 'package:provider/provider.dart';

class Productgrid extends StatelessWidget{

@override
Widget build(BuildContext context){

  final productsData=Provider.of<Products>(context);
  final products =productsData.items;
 return GridView.builder(
padding: const EdgeInsets.all(10.0),
itemCount: products.length,
itemBuilder: (ctx,i)=>Productitem(
products[i].id,
products[i].title,
products[i].imageurl,
),
gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2,
childAspectRatio: 3/2,
crossAxisSpacing: 10,
mainAxisSpacing: 10,
),
);
}}