import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/ProxyProvider2/count_provider.dart';
import 'package:provider_example/ProxyProvider2/msg_proxy_provider.dart';

class CountMsgProxyProviderExample extends StatelessWidget {
  const CountMsgProxyProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Count Msg Proxy Provider", style: TextStyle(fontSize: 25)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have pushed the button this many times : ",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Selector<CountProvider, int>(
              selector: (_, countProvider) => countProvider.count,
              builder: (context, value, child) {
                return Text(
                  value.toString(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                );
              },
            ),
            Consumer<Msg>(
              builder: (context, msgProvider, child) => Expanded(
                child: ListView.builder(
                  itemCount: msgProvider.countValues.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Hello ${msgProvider.countValues[index]}',
                          style: TextStyle(fontSize: 25)),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          countProvider.increment();
        },
      ),
    );
  }
}
