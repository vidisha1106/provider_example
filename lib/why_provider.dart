import 'dart:async';

import 'package:flutter/material.dart';

class WhyProvider extends StatefulWidget {
  const WhyProvider({Key? key}) : super(key: key);

  @override
  State<WhyProvider> createState() => _WhyProviderState();
}

class _WhyProviderState extends State<WhyProvider> {
  int count=0;
  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Why Provider",style: TextStyle(fontSize: 25)) ,
        centerTitle: true,
      ),
      body: Center(
        child: Text(count.toString(),style: TextStyle(fontSize: 50)),
      ),
    );
  }

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1),(timer){
        count++;
        print(count);
        setState(() {
        });
    });
  }
}
