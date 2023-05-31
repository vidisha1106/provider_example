import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/change_notifier_consumer/change_notifier_class.dart';
import 'package:provider_example/change_notifier_consumer/count_example.dart';
import 'package:provider_example/favourites/favourites_example.dart';
import 'package:provider_example/favourites/favourites_provider.dart';
import 'package:provider_example/multiprovider/slider_example.dart';
import 'package:provider_example/multiprovider/slider_provider.dart';
import 'package:provider_example/theme/theme_provider.dart';
import 'package:provider_example/value_notifier/stateless_counter_example.dart';
import 'package:provider_example/why_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return ChangeNotifierClass();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return SliderProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return FavouritesProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return ThemeProvider();
          },
        )
      ],
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        themeMode: Provider.of<ThemeProvider>(context).themeMode,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            brightness: Brightness.light),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
            appBarTheme: AppBarTheme(
                foregroundColor: Colors.white,
            backgroundColor: Colors.white)),
        debugShowCheckedModeBanner: false,
        routes: {
          '/MyHomePage': (context) => MyHomePage(),
          '/WhyProvider': (context) => WhyProvider(),
          '/CountExample': (context) => CountExample(),
          '/SliderExample': (context) => SliderExample(),
          '/FavouritesExample': (context) => FavouritesExample(),
          '/StatelessCounter': (context) => StatelessCounter(),
        },
        initialRoute: '/MyHomePage',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLight = true;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Provider", style: TextStyle(fontSize: 25)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              isLight = !isLight;
              provider.changeTheme(isLight? ThemeMode.light : ThemeMode.dark);
            },
            icon: isLight ? Icon(Icons.dark_mode) : Icon(Icons.light_mode),
          )
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              pathName: '/WhyProvider',
              text: "Why Provider",
            ),
            CustomElevatedButton(
              pathName: '/CountExample',
              text: "Count Example",
            ),
            CustomElevatedButton(
              pathName: '/SliderExample',
              text: "Slider Example",
            ),
            CustomElevatedButton(
              pathName: '/FavouritesExample',
              text: "Favourites Example",
            ),
            CustomElevatedButton(
              pathName: '/StatelessCounter',
              text: "Value Notifier",
            ),
          ],
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String pathName;
  final String text;

  const CustomElevatedButton({
    super.key,
    required this.pathName,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, pathName);
        },
        child: Text(text, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
