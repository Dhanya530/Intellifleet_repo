import 'package:flutter/material.dart';
import 'package:udemy_app/maindrawer.dart';
import 'package:udemy_app/model/meal.dart';
import 'categories.dart';
import 'favorites.dart';
class Tabs extends StatefulWidget {
  final List <Meal>favoriteMeals;
  Tabs(this.favoriteMeals);
  @override
  TabsState createState()=>TabsState();
}
class TabsState extends State<Tabs>{
  List<Map<String,Object>>pages;

  int selectedpageindex=0;
  @override
  void initState(){
    pages=[
      {
        'page': Categories(),'title':'Categories'
      },
      {
        'page':  Favorites(widget.favoriteMeals),
        'title':'Your Favorites'
      },

    ];
  }
  void selectpage(int index){
    setState(() {
      selectedpageindex=index;
    });

  }
  @override
Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar
        (
        title: Text(pages[selectedpageindex]['title']),
      ),
      drawer: Maindrawer(),
      body: pages[selectedpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectpage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedpageindex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon( Icons.category),
      title: Text('Categories'),
          ),
          BottomNavigationBarItem(icon: Icon( Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),



    );
  }
}