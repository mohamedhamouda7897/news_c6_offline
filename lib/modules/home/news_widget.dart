import 'package:flutter/material.dart';
import 'package:news_c6_offline/models/NewsModel.dart';
import 'package:news_c6_offline/models/SourcesModel.dart';
import 'package:news_c6_offline/shared/network/remote/api_manager.dart';

import '../../shared/components/components.dart';
import 'news_item.dart';

class NewsData extends StatelessWidget {

  Sources sources;
  NewsData(this.sources);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsModel>(
        future: ApiManager.getNewsBySource(sources.id??"","Flutter"),
        builder: (c,snapShot){

          if(snapShot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }

          if(snapShot.hasError){
            return Column(
              children: [
                Text('Something went wrong'),
                SizedBox(height: 10,),
                defaultButton(text: 'Try Agin',onPressed: (){},raduis: 12)
              ],
            );
          }

          if("ok"!=snapShot.data?.status){
            return Column(
              children: [
                Text('Something went wrong'),
                SizedBox(height: 10,),
                defaultButton(text: 'Try Agin',onPressed: (){},raduis: 12)
              ],
            );
          }

          var newsList=snapShot.data?.articles ??[];
          return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (c,index){
            return NewsItem(newsList[index]);
          });

        });
  }
}
