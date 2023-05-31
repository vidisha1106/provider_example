import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/favourites/favourites_provider.dart';

class FavouritesList extends StatefulWidget {
  const FavouritesList({Key? key}) : super(key: key);

  @override
  State<FavouritesList> createState() => _FavouritesListState();
}

class _FavouritesListState extends State<FavouritesList> {

  @override
  Widget build(BuildContext context) {
    debugPrint("Build");
    final provider=Provider.of<FavouritesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Favourites", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<FavouritesProvider>(
              builder: (context, providerValue, child) {
                return ListView.builder(
                  itemCount: provider.selectedItem.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        debugPrint("${providerValue.selectedItem}");
                      },
                      title: Text("Item ${provider.selectedItem[index].toString()}",
                          style: TextStyle(fontSize: 20)),
                      trailing: Icon(Icons.favorite),
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
