import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/Api_using_provider/data_model.dart';
import 'package:http/http.dart' as http;

class HomePageApi extends StatefulWidget {
  const HomePageApi({Key? key}) : super(key: key);

  @override
  State<HomePageApi> createState() => _HomePageApiState();
}

class _HomePageApiState extends State<HomePageApi> {
  Future<List<PetModel>> getDataFromApi() async {
    final url = Uri.parse(
        'https://jatinderji.github.io/users_pets_api/users_pets.json');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'] as List;
        return data
            .map(
              (e) => PetModel.fromJson(e),
            )
            .toList();
      } else {
        print("Falied to fetch data from API");
        return [];
      }
    } catch (e) {
      print("Erroe while fetching data from Api : $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Build called");
    return FutureProvider<List<PetModel>>(
      create: (context) {
        return getDataFromApi();
      },
      initialData: const [],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title:
              const Text("Api with Provider", style: TextStyle(fontSize: 25)),
          centerTitle: true,
        ),
        body: Consumer<List<PetModel>>(
          builder: (context, provider, child) {
            if (provider.isEmpty) {
              Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: provider.length,
              itemBuilder: (_, index) {
                return Image.network(
                  provider[index].petImage,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
