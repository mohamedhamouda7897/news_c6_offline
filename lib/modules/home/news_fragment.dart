import 'package:flutter/material.dart';
import 'package:news_c6_offline/models/SourcesModel.dart';
import 'package:news_c6_offline/models/category.dart';
import 'package:news_c6_offline/modules/home/tab_controller.dart';
import 'package:news_c6_offline/shared/network/remote/api_manager.dart';

import '../../shared/components/components.dart';

class NewsFragment extends StatelessWidget {
  static const String routeName='news';
  Category category;
  NewsFragment(this.category);
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<SourcesModel>(
          future: ApiManager.getSources(category.id),
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

            var sourcesList=snapShot.data?.sources ?? [];
            return TabsController(sourcesList,);
          });


  }
}
