import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/Api_with_provider_2/data_model.dart';
import 'package:http/http.dart' as http;

class FetchDataUsingProvider extends StatefulWidget {
  const FetchDataUsingProvider({Key? key}) : super(key: key);

  @override
  State<FetchDataUsingProvider> createState() => _FetchDataUsingProviderState();
}

class _FetchDataUsingProviderState extends State<FetchDataUsingProvider> {

  Future<List<DataModel>> fetchDataFromApi() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        return data
            .map(
              (e) => DataModel.fromJson(e),
            )
            .toList();
      } else {
        print("Failed to fetch data from Api");
        return [];
      }
    } catch (e) {
      print("error while fetching data from API : $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<DataModel>>(
      create: (BuildContext context) {
        return fetchDataFromApi();
      },
      initialData: [] ,
      child: Scaffold(
        body: SafeArea(
          child: Consumer<List<DataModel>>(
            builder: (context, provider, child) {
              if(provider.isEmpty)
                {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              return ListView.builder(
                itemCount: provider.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    child: ListTile(
                      title: Text(provider[index].title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      subtitle: Text(provider[index].body,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15)),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
