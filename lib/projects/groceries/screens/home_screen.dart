import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../data/categories.dart';
import '../models/grocery_item.dart';
import 'add_new_item_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isLoading = false;
  var isError = false;
  var _isdeleting = false;
  late List<GroceryItem> groceryItems = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    loadItems();
  }

  void _addNewItemScreen() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (context) => const AddNewItemScreen()));
    if (newItem != null) {
      setState(() {
        groceryItems.add(newItem);
      });
    }
  }

  void loadItems() async {
    try {
      final url = Uri.https(
          'shopping-18116-default-rtdb.firebaseio.com', 'shopping-list.json');
      final response = await http.get(url);
      if (json.decode(response.body) == null) {
        setState(() {
          _isLoading = false;
        });
        return;
      }
      final Map<String, dynamic> resData = json.decode(response.body);
      final List<GroceryItem> loadedItems = [];
      for (final data in resData.entries) {
        final category = categories.entries
            .firstWhere(
                (catItem) => catItem.value.name == data.value['category'])
            .value;
        loadedItems.add(GroceryItem(
          id: data.key,
          name: data.value['name'],
          quantity: data.value['quantity'],
          category: category,
        ));
      }
      setState(() {
        groceryItems = loadedItems;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        isError = true;
      });
      rethrow;
    }
  }

  void deleteItem(GroceryItem item) async {
    final index= groceryItems.indexOf(item);
    setState(() {
      groceryItems.remove(item);
      _isdeleting = true;
    });

    try{
      final url = Uri.https('shopping-18116-default-rtdb.firebaseio.com',
          'shopping-list/${item.id}.json');
      final response = await http.delete(url);
      setState(() {
        _isdeleting = false;
      });
    }catch(e){
      setState(() {
        groceryItems.insert(index, item);
        _isdeleting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Groceries'),
          actions: [
            IconButton(
                onPressed: _addNewItemScreen, icon: const Icon(Icons.add))
          ],
        ),
        body: Stack(
          children: [
            _isLoading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : isError
                ? const Center(
              child: Text('Couldn\'t load try again'),
            )
                : groceryItems.isEmpty
                ? const Center(
              child: Text(
                'No Items...',
                style: TextStyle(fontSize: 32),
              ),
            )
                : ListView.builder(
                itemCount: groceryItems.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: ValueKey(groceryItems[index].id),
                    onDismissed: (dir) {
                      setState(() {
                        deleteItem(groceryItems[index]);
                      });
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.square,
                        color: groceryItems[index].category.color,
                      ),
                      title: Text(groceryItems[index].name),
                      trailing:
                      Text('${groceryItems[index].quantity}'),
                    ),
                  );
                }),
              if(_isdeleting)
                const Center(
                  child: CircularProgressIndicator(),
                ),
          ],
        ));
  }
}
