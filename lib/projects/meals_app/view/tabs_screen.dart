import 'package:flutter/material.dart';
import '../provider/favourites_provider.dart';
import '../widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'filters_screen.dart';
import 'meals_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void setScreen(String identifier) {
    if (identifier == 'meals') {
      Navigator.pop(context);
    } else if (identifier == 'filters') {
      Navigator.pop(context);
Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> FiltersScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final favouritesMeals = ref.watch(favouritesMealsProvider);
    Widget activePage = CategoriesScreen();
    String title = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(meals: favouritesMeals);
      title = 'Favourites';
    }

    return Scaffold(
      drawer: MainDrawer(onSelectScreen: setScreen),
      appBar: AppBar(
        title: Text(title),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _selectPage,
        selectedItemColor: Colors.blue,
        // Set the color for the selected tab icon and text
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
