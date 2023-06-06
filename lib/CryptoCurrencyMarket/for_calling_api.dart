import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider_example/CryptoCurrencyMarket/crypto_model.dart';

class ForCallingAPI extends StatefulWidget {
  const ForCallingAPI({Key? key}) : super(key: key);

  @override
  State<ForCallingAPI> createState() => _ForCallingAPIState();
}

class _ForCallingAPIState extends State<ForCallingAPI> {


  String url = 'https://api.coincap.io/v2/markets';

  Future<List<CryptoModel>> fetchDataFromAPI() async {
    final url = Uri.parse('https://api.coincap.io/v2/markets');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'] as List;
        return data.map((e) => CryptoModel.fromJson(e)).toList();
      } else {
        print("Falied to fetch data from API");
        return [];
      }
    } catch (e) {
      print("Error occured while making the request : $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              FutureBuilder(
                future: fetchDataFromAPI(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error Occured : ${snapshot.error}");
                  } else {
                    final data = snapshot.data;
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          final item = data?[index];
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xffe4e4e4),
                                        blurRadius: 25,
                                        offset: Offset((0.1), (0.1)),
                                        spreadRadius: -0)
                                  ]),
                              child: ListTile(
                                title: Text(
                                  '${item?.baseId.toUpperCase().substring(0, 1)}${item?.baseId.toLowerCase().substring(1)}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                                subtitle: Text(item?.baseSymbol ?? '',
                                    style: TextStyle(fontSize: 15)),
                                trailing: Text(
                                  double.parse(item?.priceQuote.toString() ??
                                              ' 0.0')
                                          .toStringAsFixed(4) ??
                                      '',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
