import 'package:flutter/material.dart';

class Meal_Item_Trait extends StatelessWidget {
  final IconData icon;
  final String label;
  const Meal_Item_Trait({Key? key, required this.icon, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 5,),
        Text(label,style: const TextStyle(color: Colors.white),),
      ],
    );
  }
}
