import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/favourites/favourites_list.dart';
import 'package:provider_example/favourites/favourites_provider.dart';

class FavouritesExample extends StatefulWidget {
  const FavouritesExample({Key? key}) : super(key: key);

  @override
  State<FavouritesExample> createState() => _FavouritesExampleState();
}

class _FavouritesExampleState extends State<FavouritesExample> {

  @override
  Widget build(BuildContext context) {
    debugPrint("Build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Favourites Example", style: TextStyle(fontSize: 25)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavouritesList(),
                  ));
            },
            icon: Icon(Icons.favorite,color: Colors.deepPurple),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<FavouritesProvider>(
              builder: (context, providerValue, child) {
                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        if (providerValue.selectedItem.contains(index)) {
                          providerValue.removeItem(index);
                        } else {
                          providerValue.additem(index);
                        }
                        debugPrint("${providerValue.selectedItem}");
                      },
                      title: Text("Item ${index.toString()}",
                          style: TextStyle(fontSize: 20)),
                      trailing: Icon(providerValue.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
