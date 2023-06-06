import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/Api_using_provider/state/app_state.dart';

class HomePageApi extends StatelessWidget {
  const HomePageApi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Api with Provider", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Center(child: Consumer<AppState>(
        builder: (context, provider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${provider.msg}',
                style: TextStyle(fontSize: 25),
              ),
              CupertinoButton(
                onPressed: () {
                  provider.getTimer();
                },
                child: Text("Press Me"),
              )
            ],
          );
        },
      )),
    );
  }
}
