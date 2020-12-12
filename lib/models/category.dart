import 'dart:convert';

List<Category> categoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJsonAdd())));

class Category {
    String id;
    String title;
    String color;

    Category({
        this.id,
        this.title,
        this.color,
    });

  
    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] ,
        title: json["title"],
        color: json["color"],
    );


    Map<String, dynamic> toJsonAdd() => {
        "title": title,
        "color": color,
    };
    
     Map<String, dynamic> toJsonUpdate() => {
        "id": id,
        "title": title,
        "color": color,
    };
}
