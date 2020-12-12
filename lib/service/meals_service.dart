import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/meal.dart';

class MealService {
  static const ADD_URL = "http://n.com/mymeals/add.php";
  static const VIEW_URL =
      "http://n.com/contentmeals/contentviews.php";
  static const GETID_URL =
      "http://n.com/contentmeals/selectcatId.php";
  static const UPDATE_URL = "http://n.com/mymeals/update.php";
  static const DELETE_URL =
      "http://n.com/contentmeals/selectdelete.php";

  Future<String> addMeals(Meals meals) async {
    final response = await http.post(ADD_URL, body: meals.toJsonAdd());
    if (response.statusCode == 200) {
      print("Add Response : " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }


  List<Meals> mealsFromJson(String jsonString) {
    final data = json.decode(jsonString);
    return List<Meals>.from(data.map((item) => Meals.fromJson(item)));
  }

  Future<List<Meals>> getMealsData(String categoryId) async {
    final response = await http.get(VIEW_URL);
    print('Meals Response: ${response.body}');
    if (response.statusCode == 200) {
      List<Meals> list = mealsFromJson(response.body);
      return list;
    } else {
      return List<Meals>();
    }
  }
  
 Future<List> getMealsId(String mealId) async {
    final response = await http.post(
      "http://n.com/contentmeals/selectmealId.php",
      body: <String, String>{
        "id": mealId,
      },
    );
    debugPrint("Response: " + response.body);
    debugPrint("Status: " + (response.statusCode).toString());
    print('Meals Response: ${response.body}');
    if (response.statusCode == 200) {
      final datauser = json.decode(response.body);
      List<Meals>.from(datauser.map((item) => Meals.fromJson(item)));
      return datauser;
    } else {
      return List<Meals>();
    }
  }

  
    Future<List> getMealsCatId(String categoryId) async {
    final response = await http.post(
      "http://n.com/contentmeals/selectcatId.php",
      body: <String, String>{
        "catId": categoryId,
      },
    );
    debugPrint("Response: " + response.body);
    debugPrint("Status: " + (response.statusCode).toString());
    print('Meals Response: ${response.body}');
    if (response.statusCode == 200) {
      final datauser = json.decode(response.body);
      List<Meals>.from(datauser.map((item) => Meals.fromJson(item)));
      return datauser;
    } else {
      return List<Meals>();
    }
  }

  Future<String> updateMeals(Meals meals) async {
    final response = await http.post(UPDATE_URL, body: meals.toJsonUpdate());
    if (response.statusCode == 200) {
      print("Update Response : " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }
  
  //Bir sutundaki verinin değerini silme. 
  Future<String> updateMealsFavorite(String mealId, String isFavorite) async {
    final response = await http.post("http://n.com/contentmeals/mealschange.php", body: <String, String>{
        "id": mealId,
        "isFavorite": isFavorite,
      },
    );
    if (response.statusCode == 200) {
      print("Update Response : " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }

  Future<String> deleteMeals(Meals meals) async {
    final response = await http.post(DELETE_URL, body: meals.toJsonUpdate());
    if (response.statusCode == 200) {
      print("Delete Response : " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }


Future<String> deleteMealId(String mealId) async {
  
  final response = await http.post(DELETE_URL,
    body: <String, String>{
      "id": mealId,
    }
    );
  if (response.statusCode == 200) {
    print("Delete Response : " + response.body);
    return response.body;
  } else {
    return "Error";
  }
}


}
