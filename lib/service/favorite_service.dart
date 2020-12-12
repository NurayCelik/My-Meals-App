 import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/favori.dart';

class FavoriteService {
   static const ADD_URL = "http://n.com/contentmeals/favoriteadd.php";
  static const VIEW_URL =
      "http://n.com/contentmeals/favoriteviews.php";
  static const GETID_URL =
      "";
  static const UPDATE_URL = "";
  static const DELETE_URL =
      "http://n.com/contentmeals/favoritedelete.php";
 
 
 List<Favori> mealsFromJson(String jsonString) {
    final data = json.decode(jsonString);
    return List<Favori>.from(data.map((item) => Favori.fromJson(item)));
  }

  Future<List<Favori>> getFavoriteMeals() async {
    final response = await http.get(VIEW_URL);
    print('Favorite Meals Get Response: ${response.body}');
    if (response.statusCode == 200) {
      List<Favori> list = favoriFromJson(response.body);
      return list;
    } else {
      return List<Favori>();
    }
  }
  Future<String> addFavorite(String userId, String mealId) async {
    final response = await http.post(
      ADD_URL,
      body: <String, String>{
        "userId": userId,
        "mealId": mealId,
      },
    );
    
    if (response.statusCode == 200) {
      print('Favorite Add Response: ${response.body}');
       return response.body;
    } else {
      print('Not Favorite Add');
      return "Error";
    }
  }
  Future<String> deleteFavorite(String userId, String mealId) async {
  
  final response = await http.post(DELETE_URL,
     body: <String, String>{
        "userId": userId,
        "mealId": mealId,
      },
    );
  if (response.statusCode == 200) {
    print("Favorite Delete Response : " + response.body);
    return response.body;
  } else {
    return "Error";
  }
}
}
