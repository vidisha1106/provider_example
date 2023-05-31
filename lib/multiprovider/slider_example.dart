import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/multiprovider/slider_provider.dart';


class SliderExample extends StatefulWidget {
  const SliderExample({Key? key}) : super(key: key);

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(
            "MultiProvider", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<SliderProvider>(
              builder: ( context, providerValue, child) {
                return Slider(
                  min: 0,
                  max: 1,
                  value: providerValue.value, onChanged: (double value) {
                  providerValue.setSlider(value);
                },);
              },
            ),
            Consumer<SliderProvider>(
              builder: (context, providerValue, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.green.withOpacity(providerValue.value),
                        height: 100,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.pinkAccent.withOpacity(providerValue.value),
                        height: 100,
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
