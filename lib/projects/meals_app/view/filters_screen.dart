import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sharan_workroom/projects/meals_app/view/tabs_screen.dart';
import '../provider/filter_by_provider.dart';
import '../widgets/main_drawer.dart';


class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    final activeFilters = ref.watch(filterByProvider);
    final bool? glutenFreeSwitch = activeFilters[FilterBy.isGlutenFree];
    final bool? lctoseFreeSwitch = activeFilters[FilterBy.isLactoseFree];
    final bool? veganSwitch = activeFilters[FilterBy.isVegan];
    final bool? vegetarianSwitch = activeFilters[FilterBy.isVegetarian];

    return Scaffold(
        drawer: MainDrawer(onSelectScreen: (identifier) {
          if (identifier == 'meals') {
            Navigator.pop(context);
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return TabsScreen();
            }));
          } else if (identifier == 'filters') {
            Navigator.pop(context);
          }
        }),
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SwitchListTile(
                value: glutenFreeSwitch!,
                onChanged: (value) {
                  ref.read(filterByProvider.notifier).setFilter(FilterBy.isGlutenFree, value);
                },
                title: Text(
                  'Gluten-Free',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      // Theme.of(context).colorScheme.onTertiaryContainer,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Only includes Gluten-Free meals',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SwitchListTile(
                title: Text(
                  'Vegan',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Only includes Vegan meals',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                value: veganSwitch!,
                onChanged: (value) {
                    ref.read(filterByProvider.notifier).setFilter(FilterBy.isVegan, value);
                },
              ),
              SwitchListTile(
                title: Text(
                  'Vegetarian',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Only includes Vegetarian meals',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                value: vegetarianSwitch!,
                onChanged: (value) {
                  ref.read(filterByProvider.notifier).setFilter(FilterBy.isVegetarian, value);
                },
              ),
              SwitchListTile(
                title: Text(
                  'Lactose Free',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Only includes Lactose Free meals',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                value: lctoseFreeSwitch!,
                onChanged: (value) {
                  ref.read(filterByProvider.notifier).setFilter(FilterBy.isLactoseFree, value);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return const TabsScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
                  child: Text(
                    'Apply',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                      fontSize: 20,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
