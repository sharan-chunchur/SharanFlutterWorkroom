import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


import '../data/categories.dart';
import '../models/category.dart';
import '../models/grocery_item.dart';

class AddNewItemScreen extends StatefulWidget {
  const AddNewItemScreen({Key? key}) : super(key: key);

  @override
  State<AddNewItemScreen> createState() => _AddNewItemScreenState();
}

class _AddNewItemScreenState extends State<AddNewItemScreen> {
  var _isloading = false;
  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();
    String title = '';
    int quantity = 1;
    Category category = categories[Categories.vegetables]!;

    void saveItem() async{
      if (formKey.currentState!.validate()) {
        setState(() {
          _isloading =true;
        });
        formKey.currentState!.save();
        final url = Uri.https(
            'shopping-18116-default-rtdb.firebaseio.com', 'shopping-list.json');
       final response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'name': title,
            'quantity': quantity,
            'category': category.name,
          }),
        );
        final Map<String, dynamic> responseData = json.decode(response.body);
        if(context.mounted) {
          Navigator.of(context).pop(GroceryItem(
              id: responseData['name'],
              name: title,
              quantity: quantity,
              category: category));
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'Enter Valid Title';
                  }
                  return null;
                },
                onSaved: (value) {
                  title = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: quantity.toString(),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Enter Valid Quanity';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        quantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                        value: category,
                        items: categories.entries
                            .map(
                              (category) => DropdownMenuItem(
                                value: category.value,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.square,
                                      color: category.value.color,
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(category.value.name)
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          category = value!;
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed:_isloading ? null: () {
                      formKey.currentState!.reset();
                    },
                    child: const Text('Reset'),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                      onPressed:_isloading ? null: saveItem, child:_isloading ? const Center(child: CircularProgressIndicator()) : const Text('Add Item'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
