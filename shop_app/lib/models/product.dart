import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../providers/products.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageurl;
  bool isfavorite;
  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageurl,
    this.isfavorite=false,
  });

}