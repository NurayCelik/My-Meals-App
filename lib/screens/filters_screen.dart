import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/main_drawer.dart';
class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    super.initState();
  }

  void selectSwitchListMeal(
      BuildContext context, _glutenFree, _lactoseFree, _vegan, _vegetarian) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return MainDrawer(
          gluten: _glutenFree,
          lactose: _lactoseFree,
          vegan: _vegan,
          vegetarian: _vegetarian);
    }));
  }

  Widget _buildSwitchListTile(String mytitle, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(mytitle),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
      /*
      secondary: InkWell(
        onTap: () {
          print("click ligth");
        },
        child: const Icon(Icons.lightbulb_outline),
      ),
       */
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  return selectSwitchListMeal(
                      context, _glutenFree, _lactoseFree, _vegan, _vegetarian);
                }),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Adjust your meal selection.',
                  style: Theme.of(context).textTheme.headline6,
                )),
            Expanded(
              child: ListView(children: <Widget>[
                _buildSwitchListTile('Gluten-Free',
                    'Only include gluten-free meals.', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'Only include vegetarian meals.', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only include vegan meals.', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Lactose-Free',
                    'Only include lactose-free meals.',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                })
              ]),
            )
          ],
        ),
         floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.assignment_return,
        ),
        onPressed: (){
         Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => MyApp()));
        },
      ),
        );
  }
}
