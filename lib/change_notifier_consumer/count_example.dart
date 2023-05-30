import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/change_notifier_consumer/change_notifier_class.dart';

class CountExample extends StatefulWidget {
  CountExample({Key? key}) : super(key: key);

  @override
  State<CountExample> createState() => CountExampleState();
}

class CountExampleState extends State<CountExample> {

  int count = 0;


  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<ChangeNotifierClass>(context,listen: false);
    debugPrint("build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(
            "Change Notifier & Consumer", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<ChangeNotifierClass>(builder: (context, value, child) =>
            Text(
                value.count.toString(), style: TextStyle(fontSize: 50)),),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        countProvider.setCount();
      },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1),(timer) {
      final countProvider = Provider.of<ChangeNotifierClass>(context,listen: false);
      countProvider.setCount();
    },);
  }
}
