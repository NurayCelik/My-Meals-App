
import 'dart:convert';

List<Favori> favoriFromJson(String str) => List<Favori>.from(json.decode(str).map((x) => Favori.fromJson(x)));

String favoriToJson(List<Favori> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJsonAdd())));

class Favori {

    String title;
    String imageUrl;
    String ingredients;
    String steps;
    String isFavorite;
    String duration;
    String complexity;
    String affordability;
    String mealId;
    String userId;

    Favori({
        this.title,
        this.imageUrl,
        this.ingredients,
        this.steps,
        this.duration,
        this.complexity,
        this.affordability,
        this.isFavorite,
        this.mealId,
        this.userId,
    });

   

    factory Favori.fromJson(Map<String, dynamic> json) => Favori(
        title: json["title"],
        imageUrl: json["imageUrl"],
        ingredients: json["ingredients"],
        steps: json["steps"],
        duration: json["duration"],
        complexity: json["complexity"],
        affordability: json["affordability"],
        isFavorite: json["isFavorite"],
        mealId: json["mealId"],
        userId: json["userId"],
    );

    Map<String, dynamic> toJsonAdd() => {
        "title": title,
        "imageUrl": imageUrl,
        "ingredients": ingredients,
        "steps": steps,
        "duration": duration,
        "complexity": complexity,
        "affordability": affordability,
        "isFavorite": isFavorite,
        "mealId": mealId,
        "userId": userId,
    };
    Map<String, dynamic> toJsonUpdate() => {
        "title": title,
        "imageUrl": imageUrl,
        "ingredients": ingredients,
        "steps": steps,
        "duration": duration,
        "complexity": complexity,
        "affordability": affordability,
        "isFavorite": isFavorite,
        "mealId": mealId,
        "userId": userId,
    };
}