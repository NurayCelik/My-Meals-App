import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../service/categories_service.dart';
import '../models/category.dart';

class CategoriseScreen extends StatefulWidget {
  bool gluten = false;
  bool lactose = false;
  bool vegan = false;
  bool vegetarian = false;

  CategoriseScreen({
    this.gluten,
    this.lactose,
    this.vegan,
    this.vegetarian,
  });
  @override
  _CategoriseScreenState createState() => _CategoriseScreenState();
}

class _CategoriseScreenState extends State<CategoriseScreen> {
  List<Category> categoryList;
  int categoriSayisi;

  final ScrollController _scrollController = ScrollController();

  Future<List> getAllCategory() async {
    categoryList = await CategoryService().getCategoryData();
    categoriSayisi = categoryList.length;
    setState(() {});
    print("category : ${categoryList.length}");
  }

  @override
  void initState() {
    getAllCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder<List>(
          //future: getAllCategory(),
          builder: (context, snapshot) {
            if (categoriSayisi == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return CustomScrollView(
                controller: _scrollController,
                slivers: <Widget>[
                  /*
              SliverPadding(
                padding: const EdgeInsets.only(top: 0),
              ),*/
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        Category category = categoryList[index];

                        String hexString = category.color;
                        String id = category.id;
                        int myColor = int.parse("0xff$hexString");
                        return CategoryItem(
                          id,
                          category.title,
                          Color(myColor),
                          widget.gluten,
                          widget.lactose,
                          widget.vegan,
                          widget.vegetarian,
                        );
                      },

                      //childCount: categoryList.length,
                      childCount: categoriSayisi,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
       
    );
     
  }
}
