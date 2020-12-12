import 'package:flutter/material.dart';
import './service/categories_service.dart';
import 'models/category.dart';

class HttpDeneme extends StatefulWidget {
  @override
  _HttpDenemeState createState() => _HttpDenemeState();
}

class _HttpDenemeState extends State<HttpDeneme> {
  final ScrollController _scrollController = ScrollController();
  List<Category> categoryList;

  getAllCategory() async {
    categoryList = await CategoryService().getCategoryData();
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
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: SizedBox(
              height: 120.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    Category category = categoryList[index];
                    String hexString = category.color;
                    int myColor = int.parse("0xff$hexString");
                    return Card(
                      child: Container(
                        height: double.infinity,
                        //color: Color(myColor).withOpacity(0.5),
                        color: Color(myColor),

                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Text(category.color),
                          ),
                        ),
                      ),
                    );
                  })),
        )
      ],
    );
  }
}
