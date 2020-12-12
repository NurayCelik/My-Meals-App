import 'package:flutter/material.dart';
import '../widgets/favorite_item.dart';
import '../models/favori.dart';
import '../service/favorite_service.dart';

class FavoritesScreen extends StatefulWidget {
  
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int favoriSayisi;
  var favoriList;

  Future<List> getAllFavorite() async {
    favoriList = await FavoriteService().getFavoriteMeals();
    setState(() {
      favoriSayisi = favoriList.length;
    });
    print("Favori Meal Sayısı : ${favoriList.length}");
  }

  @override
  void initState() {
    getAllFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: favoriSayisi,
        itemBuilder: (BuildContext context, int index) {
          if (favoriSayisi == null) {
            return Center(child: CircularProgressIndicator());
          }
        
          Favori favori = favoriList[index];
          //title = favoriList[index].title;
          var userId = favori.userId;
          var mealId = favori.mealId;
          var imageUrl = favori.imageUrl;
          var title = favori.title;
          var ingredients = favori.ingredients;
          var steps = favori.steps;
          var isFavorite = favori.isFavorite;
          var duration = favori.duration;
          var durati = int.parse(duration);
          var complexity = favori.complexity;
          var affordability = favori.affordability;
          assert(durati is int);
          getAllFavorite();
          return FavoriteItem(
              mealId: mealId,
              userId: userId,
              title: title,
              imageUrl: imageUrl,
              duration: durati,
              complexity: complexity,
              affordability: affordability,
              ingredients: ingredients,
              steps: steps,
              isFavorite: isFavorite,
              );
             
        },
      ),
    );
  }
}
