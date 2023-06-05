import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/future_provider/future_provider.dart';

class MyFutureProviderExample extends StatefulWidget {
  const MyFutureProviderExample({Key? key}) : super(key: key);

  @override
  State<MyFutureProviderExample> createState() =>
      _MyFutureProviderExampleState();
}

class _MyFutureProviderExampleState extends State<MyFutureProviderExample> {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<String>(
      create: (BuildContext context) => Data.fetchAddress(),
      initialData: "Fetching data....",
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Future Provider", style: TextStyle(fontSize: 25)),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<String>(
                builder: (context, provider, child) {
                  return Text(
                    provider,
                    style: TextStyle(fontSize: 25),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
