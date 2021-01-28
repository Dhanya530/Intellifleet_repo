import 'package:flutter/material.dart';
import 'package:udemy_app/filters.dart';
class Maindrawer extends StatelessWidget{
  Widget buildlisttile(String title,IconData icon,Function taphandler) {
    return ListTile(leading: Icon
      (icon,
      size: 26,
    ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      onTap: taphandler



    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //
    return Drawer(
      child: Column(
        children:<Widget>[
          Container(height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
          child: Text('coooking up',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30,
            color: Theme.of(context).primaryColor,
          ),
          ),
          ),
          SizedBox(height: 20,),
          buildlisttile(
            'Meals',
            Icons.restaurant,
              (){
              Navigator.of(context).pushReplacementNamed('/') ;           }

   ),
      buildlisttile('Filters',
          Icons.settings,
    (){
  Navigator.of(context).pushReplacementNamed(Filters.routeName);
  }
  ),
    ]
      ),
    );

}}