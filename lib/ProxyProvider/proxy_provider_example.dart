import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/ProxyProvider/child_widget.dart';
import 'package:provider_example/ProxyProvider/translations.dart';

class ProxyProviderExample extends StatelessWidget {
  const ProxyProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterStream = Stream<int>.periodic(
      Duration(seconds: 1),
      (x) => x,
    );
    return MultiProvider(
      providers: [
        StreamProvider<int>(
          create: (_) {
            return counterStream;
          },
          initialData: 0,
        ),
        ProxyProvider<int,Translations>(
          update: (context, count, translation) => Translations(count),
        )
      ],
      child: ChildWidget(),
    );
  }
}
