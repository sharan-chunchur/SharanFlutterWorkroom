import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final void Function(String identifier) onSelectScreen;

  const MainDrawer({Key? key, required this.onSelectScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Cooking UP!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.fastfood, color: Theme.of(context).colorScheme.primary,),
            title: Text('Home', style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Theme.of(context).colorScheme.primary,),
            title: Text('Filters', style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),),
            onTap: () {
              onSelectScreen('filters');
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Theme.of(context).colorScheme.primary,),
            title: Text('Logout', style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),),
            onTap: () {
              // Do something when the user taps on this list tile
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
