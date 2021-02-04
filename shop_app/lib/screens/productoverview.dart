import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/productgrid.dart';
class Productoverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('MyShop'),
    ),
      body: Productgrid(),
      );

  }
}
