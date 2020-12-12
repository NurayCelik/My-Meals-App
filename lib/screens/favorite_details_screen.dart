import 'package:flutter/material.dart';
import '../service/favorite_service.dart';

class FavoriteDetailScreen extends StatefulWidget {
  /*
  Listeyi yapıcı ile gönderme
  final List<ToDo> toDoList = List.generate(
      20, (index) => ToDo("$index. eleman", "$index. elemanın açıklaması"));
      FavoriteScreens(toDoList, index); //builder index;
      final List<ToDo> toDoList;
      */

  final String userId;
  final String mealId;
  final String title;
  final String imageUrl;
  final String ingredients;
  final String steps;
  final String isFavorites;
 
  FavoriteDetailScreen(
      {@required this.userId,
      @required this.mealId,
      @required this.title,
      @required this.imageUrl,
      @required this.ingredients,
      @required this.steps,
      @required this.isFavorites,});

  @override
  _FavoriteDetailScreenState createState() => _FavoriteDetailScreenState();
}

class _FavoriteDetailScreenState extends State<FavoriteDetailScreen> {
  bool _isFavorited = true;
  int favoriSayisi;
  var favoriList;

  Future<List> getAllFavorite() async {
    favoriList = await FavoriteService().getFavoriteMeals();
    setState(() {
      favoriSayisi = favoriList.length;
    });
    print("Favori Meal Sayısı : ${favoriList.length}");
  }

  _toggleFavorite(String userId, String mealId) async {
    if (_isFavorited) {
      setState(() {
        FavoriteService().deleteFavorite(userId, mealId);
        _isFavorited = false;
    });
    }
     else {
      setState(() {
        FavoriteService().addFavorite(userId, mealId);
        _isFavorited = true;
      });
    }
  }

  @override
  void initState() {
    getAllFavorite();
    _isFavorited = true;
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
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
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
              width: double.parse(letters.length.toString()) * 60,
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
              width: double.parse(letterStep.length.toString()) * 40,
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
          _isFavorited ? Icons.star : Icons.star_border,
        ),
        onPressed: () {
          _toggleFavorite(widget.userId, widget.mealId);
        },
      ),
    );
  }
}
