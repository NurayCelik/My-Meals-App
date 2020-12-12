import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatefulWidget {
  final String title;
  final Color color;
  final String id;
  bool gluten = false;
  bool lactose = false;
  bool vegan = false;
  bool vegetarian = false;

  CategoryItem(
    this.id,
    this.title,
    this.color,
    this.gluten,
    this.lactose,
    this.vegan,
    this.vegetarian,
  );

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  void selectCategory(
      BuildContext ctx, id, title, gluten, lactose, vegan, vegetarian) {
   
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CategoryMealScreen(
          categoryId: id.toString(),
          categoryTitle: title.toString(),
          gluten: gluten,
          lactose: lactose,
          vegan: vegan,
          vegetarian: vegetarian);
    }));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(
        context,
        widget.id,
        widget.title,
        widget.gluten,
        widget.lactose,
        widget.vegan,
        widget.vegetarian,
      ),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  widget.color.withOpacity(0.7),
                  widget.color,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
      
    );
    }
}
