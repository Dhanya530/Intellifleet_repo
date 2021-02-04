import 'package:flutter/material.dart';
import 'package:udemy_app/dummy_data.dart';
class MealDetail extends StatelessWidget {
  static const routeName='/meal-detail';
  final Function toggleFavorite;
  final Function isFavorite;
  MealDetail(this.toggleFavorite,this.isFavorite);
  Widget buildsectiontitle(BuildContext context,String text){
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
  Widget buildcontainer(Widget child){
    return Container(
        decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(10)
    ),
    margin: EdgeInsets.all(20),
    padding:EdgeInsets.all(20),
    height: 200,
    width: 300,
    child: child,
    );
  }
  @override
  Widget build(BuildContext context){
    final mealid=ModalRoute.of(context).settings.arguments as String;
    final selectedmeal=DUMMY_MEALS.firstWhere((meal) => meal.id==mealid);
    return Scaffold(
      appBar: AppBar(title: Text('${selectedmeal.title}'),),
      body:SingleChildScrollView(
      child:Column (children:<Widget>[
        Container(
          height: 300,
          width: double.infinity,
          child:Image.network(selectedmeal.imageUrl,
          fit:BoxFit.cover,

        ),
        ),
        buildsectiontitle(context, 'Ingredients'),
        buildcontainer(
           ListView.builder(
             itemBuilder: (ctx,index)=>Card(
               color: Theme.of(context).accentColor,
               child: Padding(padding:EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                 child:Text(  selectedmeal.ingredients[index]),
               ),
             ),
              itemCount:selectedmeal.ingredients.length
          ),
        ),
        buildsectiontitle(context, 'steps'),
        buildcontainer(ListView.builder(
            itemBuilder: (ctx,index)=>Column (children:[ListTile(
              leading: CircleAvatar(child: Text('#${(index+1)}'),
              ),
              title: Text(selectedmeal.steps[index])
      ),

        Divider()
            ],
        ),
          itemCount: selectedmeal.steps.length,
            ),
        ),

      ],
      ),

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealid) ? Icons.star:Icons.star_border,
        ),
        onPressed:()=>toggleFavorite(mealid),
      ),
    );
  }
}