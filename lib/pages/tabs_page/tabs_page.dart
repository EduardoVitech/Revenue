import 'package:flutter/material.dart';
import 'package:revenue/pages/category_page/category_page.dart';
import 'package:revenue/pages/favorite_page/favorite_page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Vamos Cozinhar?'),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category_rounded),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(Icons.favorite_border_rounded),
                text: 'Favoritos',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const CategoryPage(),
            FavoritePage(),
          ],
        ),
      ),
    );
  }
}
