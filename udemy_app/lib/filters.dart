import 'package:flutter/material.dart';
import 'package:udemy_app/maindrawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String,bool>currentfilter;
  Filters(this.currentfilter,this.saveFilters);

  @override
  FiltersState createState() => FiltersState();
}
class FiltersState extends State<Filters> {
  bool glutenfree= false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactosefree = false;



  Widget buildswitchlisttile(String title,
      String description,
      bool currentvalue,
      Function updatevalue,)
  {
    return SwitchListTile(title: Text(title),
      value: currentvalue,
      subtitle: Text(description),
      onChanged: updatevalue,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar
        (title: Text('YOUR FILTERS'),
        actions:<Widget> [
          IconButton(icon: Icon(Icons.save), onPressed:() {
            final selectedfilters= {
              'gluten': glutenfree,
              'vegetarian': vegetarian,
              'vegan': vegan,
              'lactosefree': lactosefree,
            };

            widget.saveFilters(selectedfilters);
            },
          )],
      ),
      drawer: Maindrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text('Adjust your meal selection',
            style: Theme
                .of(context)
                .textTheme
                .title,
          ),
        ),
        Expanded(child: ListView(
          children: <Widget>[
            buildswitchlisttile(
              'Glutenfree', 'only include glutenfree meal', glutenfree,
                  (newValue) {
                setState(
                      () {
                    glutenfree = newValue;
                  },
                );
              },
            ),
            buildswitchlisttile(
              'vegetarian', 'only include vegetarian meal', vegetarian,
                  (newValue) {
                setState(
                      () {
                    vegetarian = newValue;
                  },
                );
              },
            ),
            buildswitchlisttile('vegan', 'only include vegan meal', vegan,
                  (newValue) {
                setState(
                      () {
                    vegan = newValue;
                  },
                );
              },
            ),
            buildswitchlisttile(
              'lactosefree', 'only include lactosefree meal', lactosefree,
                  (newValue) {
                setState(
                      () {
                    lactosefree = newValue;
                  },
                );
              },
            ),

          ],
        ),
        ),
      ],
      ),);
  }
}

