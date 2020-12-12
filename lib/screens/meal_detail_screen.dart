import 'package:flutter/material.dart';
import 'package:my_meals_app/service/favorite_service.dart';

class MealDetailScreen extends StatefulWidget {
  final String mealId;
  final String imageUrl;
  final String title;
  final String ingredients;
  final String steps;
  final String isFavorites;

  MealDetailScreen({
    @required this.mealId,
    @required this.imageUrl,
    @required this.title,
    @required this.ingredients,
    @required this.steps,
    @required this.isFavorites,
  });

  static const routeName = '/meal-details';

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  bool _isFavorited = true;
  var userId = 1.toString();


  _toggleFavorite(String userId, String mealId)  async {
    
    if (_isFavorited) {
      setState(() {
       FavoriteService().deleteFavorite(userId, widget.mealId);
       _isFavorited = false;
      });
    } else {
      
      setState(() {
         FavoriteService().addFavorite(userId, widget.mealId);
         _isFavorited = true;
      });
    }
  }

  /*
    bool _isFavorited = true;
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }
*/

  @override
  void initState() {
    /*
    newIsFavorite = int.parse(widget.isFavorites);
    assert(newIsFavorite is int);
    */
    _isFavorited=false;
    super.initState();
  }

  Widget buildSectionTitle(BuildContext context, String mytext) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 10),
      child: Text(
        mytext,
        style: Theme.of(context).textTheme.headline6,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var letters = widget.ingredients.split(',');
    var letterStep = widget.steps.split(',');

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: double.parse(letters.length.toString()) * 30,
              width: 300,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      color: Theme.of(context).accentColor,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6.0,
                                horizontal: 10,
                              ),
                              child: Text(
                                letters[index].trim().toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ]));
                },
                itemCount: letters.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: double.parse(letterStep.length.toString()) * 30,
              width: 300,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'),
                        ),
                        title: Text(
                          letterStep[index].trim().toString(),
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: letterStep.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _isFavorited
              ? Icons.star
              : Icons.star_border,
        ),
        onPressed: () {
          _toggleFavorite(userId, widget.mealId);
        },
      ),
      /* floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.assignment_return,
        ),
        
        onPressed: (){
        
        Navigator.of(context).pop();
         // Navigator.of(context).pop(mealId);
        },
      ), */
    );
  }
}
