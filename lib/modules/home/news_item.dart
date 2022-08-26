import 'package:flutter/material.dart';
import 'package:news_c6_offline/models/NewsModel.dart';

class NewsItem extends StatelessWidget {

  Articles articles;
  NewsItem(this.articles);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Container(
          clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4)
          ),
            child: Image.network(articles.urlToImage ??"",height: 180,fit: BoxFit.fill,)),
        SizedBox(height: 5,),
        Text(articles.author??"",style: TextStyle(color: Colors.grey),),
        SizedBox(height: 5,),
        Text(articles.title??"",style: Theme.of(context).textTheme.headline1?.copyWith(
          color: Colors.black
        ),),
        SizedBox(height: 5,),
        Text(articles.publishedAt?.substring(0,10)??"",textAlign: TextAlign.right,),
      ],

      ),
    );
  }
}
