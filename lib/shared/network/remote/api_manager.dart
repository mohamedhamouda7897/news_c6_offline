import 'dart:convert';



import 'package:http/http.dart' as http;
import 'package:news_c6_offline/models/NewsModel.dart';
import 'package:news_c6_offline/models/SourcesModel.dart';
import 'package:news_c6_offline/shared/network/remote/end_points.dart';

import '../../components/constants.dart';
class ApiManager{



 static Future<SourcesModel> getSources(String category)async{
// ?apiKey=dc3d106e730c4256b8c275d9da58d090
    var url=Uri.https(BASEURL,SOURCES,{
      'apiKey':APIKEY,
      "category":category
    });
    var response= await http.get(url);

    try{
      var bodyResponse=response.body;
      var json =jsonDecode(bodyResponse);
      var responseData=SourcesModel.fromJson(json);
      return responseData;
    }catch(e){
      throw e;
    }


  }

 static Future<NewsModel> getNewsBySource(String sourceId,String search)async{

   var url=Uri.https(BASEURL, EVERYTHING,{
     "apiKey":"dc3d106e730c4256b8c275d9da58d090",
     "sources":sourceId,
     "q":search
   });

   var response = await http.get(url);

   try{
     var bodyString=response.body;

     var json=jsonDecode(bodyString);

     var newsRessponse= NewsModel.fromJson(json);
     return newsRessponse;
   }catch(error){
     throw error;
   }

  }

}