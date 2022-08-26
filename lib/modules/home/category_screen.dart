import 'package:flutter/material.dart';
import 'package:news_c6_offline/models/category.dart';

import 'category_widget.dart';

class CategoriesScreen extends StatelessWidget {

  var categories=Category.getCategories();
  Function onClickedItem;
  CategoriesScreen(this.onClickedItem);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('Pick Your Category of interest',style: Theme.of(context).textTheme.headline1?.copyWith(
            color: Colors.grey,
            fontSize: 32
          ),),
        Expanded(
          child: GridView.builder(
              itemCount:  categories.length ,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8
          ),
              itemBuilder: (c,index){
            return InkWell(
                onTap: (){
                  onClickedItem(categories[index]);
                },
                child: CategoryWidget(categories[index],index));
              }),
        )

        ],
      ),
    );
  }
}
