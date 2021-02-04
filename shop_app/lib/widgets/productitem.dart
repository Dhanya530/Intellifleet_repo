
import 'package:flutter/material.dart';
import '../screens/productdetails.dart';


class Productitem extends StatelessWidget {
  final String id;
  final String title;
  final String imageurl;
  Productitem(
      this.id,
      this.title,
      this.imageurl,
      );
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
    
    child: GridTile(
      child:GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(Productdetails.routename,
          arguments: id,);
        },
      child: Image.network(
        imageurl,
        fit: BoxFit.cover,
      ), ),
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: Icon(Icons.favorite),
          color: Theme.of(context).accentColor,
          onPressed: () {},
        ),
        title: Text(
            title,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
          color: Theme.of(context).accentColor,
        ),
      ),
    )
    );
  }
}