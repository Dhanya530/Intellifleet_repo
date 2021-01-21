import 'package:flutter/material.dart';

import 'package:udemy_app/dummy_data.dart';
import 'package:udemy_app/mealitem.dart';

class CategoryMeals extends StatelessWidget{
  static const routeName ='/category-meals';
 // final String categoryid;
 // final String categorytitle;
 // CategoryMeals(this.categoryid,this.categorytitle);
  @override
  Widget build (BuildContext context){
    final routeArgs=
    ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryTitle = routeArgs['title'];
    final categoryid = routeArgs['id'];
    final categorymeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryid);

    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
        body:ListView.builder(itemBuilder: (ctx,index){
          return Mealitem(
              title: categorymeals[index].title,
              imageUrl:categorymeals[index].imageUrl,
              duration: categorymeals[index].duration,
            affordability: categorymeals[index].affordability,
          complexity: categorymeals[index].complexity,);

        },itemCount:categorymeals.length,),


      );

  }
}