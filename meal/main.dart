
import 'package:flutter/material.dart';
import 'package:udemy_app/categories.dart';
import 'package:udemy_app/category_meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'DELIMEALS',
       //   home: Categories(),
        initialRoute: '/',
        routes: {
          '/': (ctx) => Categories(),
            CategoryMeals.routeName:(ctx)=>CategoryMeals()
          },
          theme: ThemeData(
            primarySwatch: Colors.pink,
            accentColor: Colors.amber,
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
              fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1)
              ),
         body2: TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1)
            ),
    title: TextStyle(
    fontSize: 24,
    fontFamily: 'RobotoCondensed',
    )
    ),
    ) );





  }
  }
