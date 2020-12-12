import 'package:flutter/material.dart';
import 'package:my_meals_app/main.dart';
import '../widgets/meal_item.dart';
import '../service/meals_service.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';

// Route olmadan gerekliydi.
  final String categoryId;
  final String categoryTitle;
  bool gluten = false;
  bool lactose = false;
  bool vegan = false;
  bool vegetarian = false;

  CategoryMealScreen({
    this.gluten,
    this.lactose,
    this.vegan,
    this.vegetarian,
    this.categoryId,
    this.categoryTitle,
  });

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  int mealSayisi;
  String title;
  var mealList;
  bool statefilters = true;
  var mealId;


  Future<List> getAllMeal() async {
    mealList = await MealService().getMealsCatId(widget.categoryId);
    mealSayisi = mealList.length;
   setState(() {
      mealSayisi;
     
    });
    print("meal Sayısı : ${mealList.length}");
  }

  @override
  void initState() {
    getAllMeal();
    mealId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool glutens = widget.gluten;
    bool lactoses = widget.lactose;
    bool vegans = widget.vegan;
    bool vegetarians = widget.vegetarian;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryTitle),
      ),
      body: ListView.builder(
        itemCount: mealSayisi,
        itemBuilder: (BuildContext ctx, int index) {
           
          if (mealSayisi == null)
            return Center(child: CircularProgressIndicator());
          
          title = mealList[index]['title'];
          //  print("benim title ${title}");
          var duration = mealList[index]['duration'];
          var durati = int.parse(duration);
          assert(durati is int);
          var isGlutenFree = mealList[index]['isGlutenFree'];
          var isGluten = int.parse(isGlutenFree);
          isGluten == 0 ? false : true;
          var isLactoseFree = mealList[index]['isLactoseFree'];
          var isLactose = int.parse(isLactoseFree);
          isLactose == 0 ? false : true;
          var isVegan = mealList[index]['isVegan'];
          var myIsVegan = int.parse(isVegan);
          myIsVegan == 0 ? false : true;
          var isVegetarian = mealList[index]['isVegetarian'];
          var myIsVegetarian = int.parse(isVegetarian);
          myIsVegetarian == 0 ? false : true;

          mealId = mealList[index]['id'];
          var indexListInt = int.parse(mealId);
          assert(indexListInt is int);
          
          print("my vegetarian" + myIsVegetarian.toString());
          if (glutens != null ||
              lactoses != null ||
              vegans != null ||
              vegetarians != null) {
            
            statefilters = true;
            if(glutens && isGluten == 0) {
              statefilters = false;
              indexListInt = null;
              return Center(child: Text("Data not found!"));
            }
            else if(lactoses && isLactose == 0) {
              statefilters = false;
              indexListInt = null;
             // index--;
              return Center(child: Text("Data not found!"));
            }
            else if(vegans && myIsVegan == 0) {
              statefilters = false;
              indexListInt = null;
              //index--;
              return Center(child: Text("Data not found!"));
            }

            else if(vegetarians && myIsVegetarian == 0) {
              statefilters = false;
              indexListInt = null;
              return Center(child: Text("Data not found!"));
            }
            
            else if (statefilters && indexListInt != null) {
              
              return MealItem(
                id: mealList[index]['id'],
                title: title,
                imageUrl: mealList[index]['imageUrl'],
                duration: durati,
                complexity: mealList[index]['complexity'],
                affordability: mealList[index]['affordability'],
                ingredients: mealList[index]['ingredients'],
                steps: mealList[index]['steps'],
                isFavorite: mealList[index]['isFavorite'],
              );
            }
            else 
            {
              statefilters = false;
              }
          } else {
          return MealItem(
              id: mealList[index]['id'],
              title: title,
              imageUrl: mealList[index]['imageUrl'],
              duration: durati,
              complexity: mealList[index]['complexity'],
              affordability: mealList[index]['affordability'],
              ingredients: mealList[index]['ingredients'],
              steps: mealList[index]['steps'],
              isFavorite:mealList[index]['isFavorite'],
            );
          }
        
        },
        //itemCount: mealSayisi,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.assignment_return,
        ),
        onPressed: (){
         Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => MyApp()));
        
        },
      ),
    );
  }
}
