import 'package:flutter/cupertino.dart';
import 'package:provider_example/ProxyProvider/api.dart';

class HomeModel extends ChangeNotifier
{
  final Api api;

  HomeModel({required this.api});

}
