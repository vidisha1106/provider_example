import 'package:flutter/cupertino.dart';
import 'package:provider_example/ProxyProvider/counter_provider.dart';

class MsgProvider extends ChangeNotifier {
  String msg;
  final CounterProvider counterProvider;

  MsgProvider(this.counterProvider,this.msg);

}
