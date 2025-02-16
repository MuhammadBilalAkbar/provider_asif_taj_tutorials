import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/favorite_provider.dart';

class MyFavorites extends StatefulWidget {
  const MyFavorites({super.key});

  @override
  State<MyFavorites> createState() => _MyFavoritesState();
}

class _MyFavoritesState extends State<MyFavorites> {
  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorite'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favoriteProvider.favorites.length,
              itemBuilder: (context, index) {
                int item = favoriteProvider.favorites[index];
                return Consumer<FavoriteProvider>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.favorites.contains(item)) {
                          value.removeFavorite(item);
                        }
                      },
                      title: Text('Item $item'),
                      trailing: Icon(
                        value.favorites.contains(item)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                      ),
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
