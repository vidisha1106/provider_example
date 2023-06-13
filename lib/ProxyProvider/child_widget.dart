import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/ProxyProvider/translations.dart';

class ChildWidget extends StatelessWidget {
  const ChildWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final val=context.watch<Translations>();
    return Center(child: Text(val.title));
  }
}
