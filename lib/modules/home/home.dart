
import 'package:flutter/material.dart';
import 'package:news_c6_offline/models/category.dart';
import 'package:news_c6_offline/modules/home/drawer.dart';
import 'package:news_c6_offline/modules/home/news_fragment.dart';

import 'category_screen.dart';

class HomeScreen extends StatefulWidget {

  static const String routeName='HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News'),

      ),
      drawer: HomeDrawer(onMenuItemClicked),
      body: IsSelectedCategory==null?CategoriesScreen(onClickedItem):NewsFragment(IsSelectedCategory!),
    );
  }

  Category? IsSelectedCategory;

  onMenuItemClicked(index){
    Navigator.pop(context);

    if(index==HomeDrawer.CATEGORIES){
      IsSelectedCategory=null;
      setState(() {

      });
    }else if(index==HomeDrawer.SETTINGS){

    }



  }

  onClickedItem(category){
    IsSelectedCategory=category;
    setState(() {

    });
  }
}
