import 'package:flutter/material.dart';
import 'package:untitled/screens/categories_screen.dart';
import 'package:untitled/screens/favorites_screen.dart';
import 'package:untitled/widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsSreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsSreen(this.favoriteMeals);

  @override
  State<TabsSreen> createState() => _TabsSreenState();
}

class _TabsSreenState extends State<TabsSreen> {
  List<Map<String, dynamic>> _pages = [];

  int _selectedPageIdex = 0;

  @override
  initState(){
    _pages = [
      {
        'page' : CategoriesScreen(),
        'title' : 'Categories'
      },
      {
        'page' : FavoritesScreen(widget.favoriteMeals),
        'title' : 'Favorites'
      }
    ];
    super.initState();
  }

  void _selectPage(int index){
    setState((){
      _selectedPageIdex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text(_pages[_selectedPageIdex]['title']),
          ),
          drawer: MainDrawer(),
          body: _pages[_selectedPageIdex]['page'],
          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            currentIndex: _selectedPageIdex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
            ],
          ),
    );
  }
}
