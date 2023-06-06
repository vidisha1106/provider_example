import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider_example/Api_using_provider/data_model.dart';
class DataUtil
{
  Future<List> getData() async{
    try{

      List<DataModel> listData=[];

      var request = http.Request('GET', Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      request.body = '''''';

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var rawData=await response.stream.bytesToString();
        List<dynamic> data=jsonDecode(rawData);
        data.forEach((element){
            DataModel model=DataModel.fromJson(element);
            listData.add(model);
        });
        return listData;
      }
      else {
        print(response.reasonPhrase);
        return [];
      }
    }
    catch(e)
    {
      print("Exception in Data : $e");
      throw e ;
    }
  }
}