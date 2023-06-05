import 'package:flutter/material.dart';

class CustomNavigationObserver extends NavigatorObserver {


  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('didStartUserGesture');
    if (route.isFirst) {
      showDialog(
          context: route.navigator!.context,
          builder: (BuildContext context) {
            return AlertDialog(
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Yes"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(route.navigator!.context);
                  },
                  child: Text("No"),
                )
              ],
            );
          });
    }
  }
}
