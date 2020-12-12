// To parse this JSON data, do
//
//     final meals = mealsFromJson(jsonString);

import 'dart:convert';

List<Meals> mealsFromJson(String str) => List<Meals>.from(json.decode(str).map((x) => Meals.fromJson(x)));

String mealsToJson(List<Meals> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJsonAdd())));

enum Comlexity{
  Simple,
  Challenging,
  Hard
}

enum Affordability{
  Affordable,
  Pricey,
  Luxurious,
}

class Meals {
    
    final String id;
    final String catId;
    final String title;
    final String imageUrl;
    final String ingredients;
    final String steps;
    final String duration;
    //final Complexity complexity;
    final String complexity;
    //final Affordability affordability;
    final String affordability;
    final String isGlutenFree;
    final String isLactoseFree;
    final String isVegan;
    final String isVegetarian;
    final String isFavorite;
    
    Meals({
        this.id,
        this.catId,
        this.title,
        this.imageUrl,
        this.ingredients,
        this.steps,
        this.duration,
        this.complexity,
        this.affordability,
        this.isGlutenFree,
        this.isLactoseFree,
        this.isVegan,
        this.isVegetarian,
        this.isFavorite
    });



    factory Meals.fromJson(Map<String, dynamic> json) => Meals(
        id: json["id"],
        catId: json["catId"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        ingredients: json["ingredients"],
        steps: json["steps"],
        duration: json["duration"],
        complexity: json["complexity"],
        affordability: json["affordability"],
        isGlutenFree: json["isGlutenFree"],
        isLactoseFree: json["isLactoseFree"],
        isVegan: json["isVegan"],
        isVegetarian: json["isVegetarian"],
        isFavorite: json["isFavorite"],
    );

    Map<String, dynamic> toJsonAdd() => {
        "id": id,
        "catId": catId,
        "title": title,
        "imageUrl": imageUrl,
        "ingredients": ingredients,
        "steps": steps,
        "duration": duration,
        "complexity": complexity,
        "affordability": affordability,
        "isGlutenFree": isGlutenFree,
        "isLactoseFree": isLactoseFree,
        "isVegan": isVegan,
        "isVegetarian": isVegetarian,
        "isFavorite": isFavorite,
    };
      Map<String, dynamic> toJsonUpdate() => {
        "id": id,
        "catId": catId,
        "title": title,
        "imageUrl": imageUrl,
        "ingredients": ingredients,
        "steps": steps,
        "duration": duration,
        "complexity": complexity,
        "affordability": affordability,
        "isGlutenFree": isGlutenFree,
        "isLactoseFree": isLactoseFree,
        "isVegan": isVegan,
        "isVegetarian": isVegetarian,
         "isFavorite": isFavorite,
    };
  
}
