/// With setState
// import 'package:flutter/material.dart';
//
// class FavoriteScreen extends StatefulWidget {
//   const FavoriteScreen({super.key});
//
//   @override
//   State<FavoriteScreen> createState() => _FavoriteScreenState();
// }
//
// class _FavoriteScreenState extends State<FavoriteScreen> {
//   List<int> selectedItems = [];
//
//   @override
//   Widget build(BuildContext context) {
//     debugPrint('build');
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorite Screen'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: 100,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   onTap: () {
//                     if (!selectedItems.contains(index)) {
//                       selectedItems.add(index);
//                     } else {
//                       selectedItems.remove(index);
//                     }
//                     setState(() {});
//                   },
//                   title: Text('Item $index'),
//                   trailing: Icon(
//                     selectedItems.contains(index)
//                         ? Icons.favorite
//                         : Icons.favorite_outline,
//                   ),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

/// With Provider Re-building Complete UI

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../provider/favorite_provider.dart';
//
// class FavoriteScreen extends StatefulWidget {
//   const FavoriteScreen({super.key});
//
//   @override
//   State<FavoriteScreen> createState() => _FavoriteScreenState();
// }
//
// class _FavoriteScreenState extends State<FavoriteScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final favoriteProvider = Provider.of<FavoriteProvider>(context);
//     debugPrint('build');
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorite Screen'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: 100,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   onTap: () {
//                     if (!favoriteProvider.favorites.contains(index)) {
//                       favoriteProvider.addFavorite(index);
//                     } else {
//                       favoriteProvider.removeFavorite(index);
//                     }
//                     // setState(() {});
//                   },
//                   title: Text('Item $index'),
//                   trailing: Icon(
//                     favoriteProvider.favorites.contains(index)
//                         ? Icons.favorite
//                         : Icons.favorite_outline,
//                   ),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

/// With Provider Expert

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/screens/with_provider/favorite/my_favorites.dart';

import '../../../provider/favorite_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Screen'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyFavorites()),
              );
            },
            child: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Consumer<FavoriteProvider>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (!value.favorites.contains(index)) {
                          value.addFavorite(index);
                        } else {
                          value.removeFavorite(index);
                        }
                      },
                      title: Text('Item $index'),
                      trailing: Icon(
                        value.favorites.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
