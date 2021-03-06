import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_app/model/meal.dart';
import 'package:udemy_app/meal_detail.dart';

class Mealitem extends  StatelessWidget{
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  Mealitem({
    @required this.id,
    @required this . title,
    @required   this . imageUrl,
    @required  this . duration,
    @required  this . complexity,
    @required  this.affordability,
});

  String get complexityText {
    switch(complexity){
      case Complexity.Simple:
        return'simple';
        break;
      case Complexity.Challenging:
        return'Challenging';
        break;
      case Complexity.Hard:
        return'Hard';
        break;
      default:
        return 'Unknown';
    }
  }
  String get affordabilitytext{

    switch(affordability){
      case Affordability.Affordable:
        return'Affordable';
        break;
      case Affordability.Pricey:
        return'Pricey';
        break;
      case Affordability.Luxurious:
        return'Expensive';
        break;

      default:
        return 'Unknown';
    }

  }
  Void selectmeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetail.routeName,
      arguments: id,
    ).then((result)
    {
    if(result!=null){
    //  removeitem(result);
    }
    });
  }
  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap:()=> selectmeal(context),
      child: Card(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
    ),
        elevation: 4,
          margin: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Stack(children:<Widget> [
            ClipRRect(
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
              child: Image.network(
                imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
            bottom: 20,
            right: 10,
            child:Container(
            width:220,
            color: Colors.black54,
            padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20),
            child:Text(title,style: TextStyle(
                fontSize: 26,
                color:Colors.white),

              softWrap: true,
              overflow: TextOverflow.fade,
            )
            ),
            ),
          ],
          ),
          Padding(padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(children: <Widget>[
                  Icon(Icons.schedule_outlined,),
                  SizedBox(width: 6,),
                  Text('$duration min'),
                ],),
                Row(children: <Widget>[
                  Icon(Icons.work,),
                  SizedBox(width: 6,),
                  Text(complexityText),
                ],),
                Row(children: <Widget>[
                  Icon(Icons.money,),
                  SizedBox(width: 6,),
                  Text(affordabilitytext),
                ],),
              ],
            ),
          )
        ],
        ),
      ),
    );
  }
}