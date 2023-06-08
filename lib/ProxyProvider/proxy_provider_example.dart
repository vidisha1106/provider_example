import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/ProxyProvider/counter_provider.dart';

class ProxyProviderExample extends StatefulWidget {
  const ProxyProviderExample({Key? key}) : super(key: key);

  @override
  State<ProxyProviderExample> createState() => _ProxyProviderExampleState();
}

class _ProxyProviderExampleState extends State<ProxyProviderExample> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("ProxyProvider", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "your message should be equal to the counter value",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Consumer<CounterProvider>(
              builder: (context, provider, child) => Text(
                provider.count.toString(),
                style: TextStyle(fontSize: 50),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            provider.updateCount();
          },
          child: Icon(Icons.add)),
    );
  }
}
