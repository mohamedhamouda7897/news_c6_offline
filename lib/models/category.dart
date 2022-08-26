import 'package:flutter/material.dart';

class Category{

  String id;
  String title;
  String imageUrl;
  Color ColorCode;

  Category(this.id, this.title, this.imageUrl, this.ColorCode);

  static List<Category>getCategories(){

    return [
      Category('Sports', 'Sports', 'assets/images/sport.png', Color(0xFFC91C22)),
      Category('general', 'General', 'assets/images/Politics.png', Color(0xFF003E90)),
      Category('Health', 'Health', 'assets/images/health.png', Color(0xFFED1E79)),
      Category('Business', 'Business', 'assets/images/bussines.png', Color(0xFFCF7E48)),
      Category('entertainment', 'Entertainment', 'assets/images/environment.png', Color(0xFF4882CF)),
      Category('Science', 'Science', 'assets/images/science.png', Color(0xFFF2D352)),
    ];
  }
}