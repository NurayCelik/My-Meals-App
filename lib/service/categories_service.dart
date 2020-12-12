import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';

class CategoryService {
  static const ADD_URL =
      "http://nc.nuraycelik.com/mymeals/add.php";
  static const VIEW_URL =
      "http://nc.nuraycelik.com/mymeals/viewmeal.php";
  static const UPDATE_URL =
      "http://nc.nuraycelik.com/mymeals/update.php";
  static const DELETE_URL =
      "http://nc.nuraycelik.com/mymeals/delete.php";

  Future<String> addCategory(Category category) async {
    final response = await http.post(ADD_URL, body: category.toJsonAdd());
    if (response.statusCode == 200) {
      print("Add Response : " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }

  List<Category> categoryFromJson(String jsonString) {
    final data = json.decode(jsonString);
    return List<Category>.from(data.map((item) => Category.fromJson(item)));
  }

  Future<List<Category>> getCategoryData() async {
    final response = await http.get(VIEW_URL);
    print('Category Response: ${response.body}');
    if (response.statusCode == 200) {
      List<Category> list = categoryFromJson(response.body);
      return list;
    } else {
      return List<Category>();
    }
  }
 
  
 
  Future<String> updateCategory(Category category) async {
    final response =
        await http.post(UPDATE_URL, body: category.toJsonUpdate());
    if (response.statusCode == 200) {
      print("Update Response : " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }

  Future<String> deleteCategory(Category category) async {
    final response =
        await http.post(DELETE_URL, body: category.toJsonUpdate());
    if (response.statusCode == 200) {
      print("Delete Response : " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }
}
