import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  bool gluten = false;
  bool lactose = false;
  bool vegan = false;
  bool vegetarian = false;

  MainDrawer({
    this.gluten,
    this.lactose,
    this.vegan,
    this.vegetarian,
  });

  Widget buildListTile(String myTitle, IconData myIcon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        myIcon,
        size: 26,
      ),
      title: Text(
        myTitle,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold //FontWeight.w700 ile aynı
            ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context)
                .accentColor, //container için background color, decoration Boxdecoration color kullandığımızda decoration color geçerli oluyor
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant,
              // () {Navigator.of(context).pushReplacementNamed('/');}),
              () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => CategoriseScreen(
                          gluten: gluten,
                          lactose: lactose,
                          vegan: vegan,
                          vegetarian: vegetarian,
                        )));
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
      
    );

    
  }
}
