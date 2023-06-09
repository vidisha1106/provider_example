import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/ProxyProvider/api.dart';
import 'package:provider_example/ProxyProvider/home_model.dart';

class ProxyProviderExample extends StatefulWidget {
  const ProxyProviderExample({Key? key}) : super(key: key);

  @override
  State<ProxyProviderExample> createState() => _ProxyProviderExampleState();
}

class _ProxyProviderExampleState extends State<ProxyProviderExample> {
  @override
  Widget build(BuildContext context) {
    final counterProvider =
        Provider.of<CounterProvider>(context, listen: false);
    final msgProvider = Provider.of<MsgProvider>(context, listen: false);

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
            Consumer<MsgProvider>(
              builder: (context, value, child) {
                return Text(
                  " Hey \n ${value.getMessage(context)}",
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
            /*ProxyProvider<CounterProvider, MsgProvider>(
                update: ( context, value, previous) {
                  return previous;
                },
                child: Text(
                  " Hey \n ${msgProvider.countMsg}",
                  style: TextStyle(fontSize: 20),
                ))*/
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            counterProvider.updateCount();
            msgProvider.getMessage(context);
          },
          child: Icon(Icons.add)),
    );
  }
}
