import 'package:flutter/material.dart';
import 'package:my_meals_app/screens/favorite_details_screen.dart';

class FavoriteItem extends StatefulWidget {
  final String mealId;
  final String userId;
  final String title;
  final String imageUrl;
  final int duration;
  final String complexity;
  final String affordability;
  final String ingredients;
  final String steps;
  final String isFavorite;
  FavoriteItem({
    @required this.mealId,
    @required this.userId,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.ingredients,
    @required this.steps,
    @required this.isFavorite,
  });

  @override
  _FavoriteItemState createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  String get complexityText {
    switch (widget.complexity) {
      case 'Simple':
        return 'Simple';
        break;
      case 'Challenging':
        return 'Challenging';
        break;
      case 'Hard':
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (widget.affordability) {
      case 'Affordable':
        return 'Affordable';
        break;
      case 'Pricey':
        return 'Pricey';
        break;
      case 'Luxurious':
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectFavori(
    BuildContext context,
  ) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return FavoriteDetailScreen(
        mealId: widget.mealId,
        userId: widget.userId,
        imageUrl: widget.imageUrl,
        title: widget.title,
        ingredients: widget.ingredients,
        steps: widget.steps,
        isFavorites: widget.isFavorite,
      );
    }));
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
    return InkWell(
      onTap: () => selectFavori(
        context,
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    widget.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      widget.title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(
                      Icons.schedule,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('${widget.duration} min'),
                  ]),
                  Row(children: <Widget>[
                    Icon(
                      Icons.work,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(complexityText),
                  ]),
                  Row(children: <Widget>[
                    Icon(
                      Icons.attach_money,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(affordabilityText),
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
