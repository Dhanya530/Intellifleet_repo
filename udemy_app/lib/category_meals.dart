

import 'package:flutter/material.dart';

import 'package:udemy_app/dummy_data.dart';
import 'package:udemy_app/mealitem.dart';
import 'package:udemy_app/model/meal.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal>availablemeals;
  CategoryMeals(this.availablemeals);

  // final String categoryid;
  // final String categorytitle;
  // CategoryMeals(this.categoryid,this.categorytitle);
  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}
class _CategoryMealsState extends State<CategoryMeals> {
  String categoryTitle;
  List<Meal>displayedmeals;
  var loadedinitdata=false;

  @override
  void initState() {
    //.....
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(loadedinitdata==false) {
      final routeArgs =
      ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryid = routeArgs['id'];
      displayedmeals = widget.availablemeals.where((meal) {
        return meal.categories.contains(categoryid);
      }).toList();
      loadedinitdata = true;
    }
      super.didChangeDependencies();
    }
    void___removeMeal(String mealid) {
      setState(() {
        displayedmeals.removeWhere((meal) => meal.id == mealid);
      });
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx, index) {
        return Mealitem(
          id: displayedmeals[index].id,
          title: displayedmeals[index].title,
          imageUrl: displayedmeals[index].imageUrl,
          duration: displayedmeals[index].duration,
          affordability: displayedmeals[index].affordability,
          complexity: displayedmeals[index].complexity,

        );
      },
        itemCount: displayedmeals.length,
      ),


    );
  }
}
