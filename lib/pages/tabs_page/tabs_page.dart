import 'package:flutter/material.dart';
import 'package:revenue/pages/category_page/category_page.dart';
import 'package:revenue/pages/favorite_page/favorite_page.dart';
import 'package:revenue/widgets/main_drawer/main_drawer.dart';

class TabsPage extends StatefulWidget {
  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectePageIndex = 0;
  final List<Widget> _pages = [
    const CategoryPage(),
    FavoritePage(),
  ];

  final List<String> _titles = [
    'Lista de Categorias',
    'Meus Favoritos',
  ];

  _selectedPage(int index) {
    setState(() {
      _selectePageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(_titles[_selectePageIndex]),
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectePageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        // ignore: deprecated_member_use
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectePageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category_rounded),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
