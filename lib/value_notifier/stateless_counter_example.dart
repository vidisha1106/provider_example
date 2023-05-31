import 'package:flutter/material.dart';

class StatelessCounter extends StatelessWidget {
  StatelessCounter({Key? key}) : super(key: key);

  ValueNotifier<int> counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    debugPrint("Build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("ValueNotifier", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ValueListenableBuilder(
                valueListenable: toggle,
                builder: ( context, value, child) {
                  debugPrint("textfield build");
                  return TextFormField(
                    obscureText: toggle.value,
                    style: TextStyle(fontSize: 25),
                    decoration: InputDecoration(
                        suffix: IconButton(
                          onPressed: () {
                            toggle.value = !toggle.value;
                          },
                          icon: Icon(toggle.value? Icons.visibility_off : Icons.visibility),
                        ),
                        hintText: "Enter Password"),
                  );
                },
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ValueListenableBuilder(
              valueListenable: counter,
              builder: (context, value, child) {
                debugPrint("counter build");
                return Text(counter.value.toString(),
                    style: TextStyle(fontSize: 50));
              },
            ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            counter.value++;
          },
          child: Icon(Icons.add)),
    );
  }
}
