import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Your Favorites'},
  ];

  int selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}

// top tabBar
// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 2,
//         // initialIndex: 0,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text('Meals'),
//             bottom: TabBar(
//               tabs: [
//                 Tab(icon: Icon(Icons.category), text: 'Categories'),
//                 Tab(icon: Icon(Icons.star), text: 'Favorites'),
//               ],
//             ),
//           ),
//           body: TabBarView(
//             children: [
//               CategoriesScreen(),
//               FavoritesScreen(),
//             ],
//           ),
//         ));
//   }
// }
