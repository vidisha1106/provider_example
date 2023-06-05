import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/stream_provider/stream_provider.dart';

class MyStreamProviderExample extends StatefulWidget {
  const MyStreamProviderExample({Key? key}) : super(key: key);

  @override
  State<MyStreamProviderExample> createState() =>
      _MyStreamProviderExampleState();
}

class _MyStreamProviderExampleState extends State<MyStreamProviderExample> {
  @override
  Widget build(BuildContext context) {
    final int count=context.watch<int>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Stream Provider", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Name : Vidisha",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "Age : $count",
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
