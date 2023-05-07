import 'package:flutter/material.dart';
import '../model/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/favourites_provider.dart';

class FavIconButton extends ConsumerStatefulWidget {
  Meal mealItem;

  FavIconButton({Key? key, required this.mealItem}) : super(key: key);

  @override
  ConsumerState<FavIconButton> createState() => _FavIconButtonState();
}

class _FavIconButtonState extends ConsumerState<FavIconButton> {
  late bool _isFav;

  @override
  void initState() {
    super.initState();
    if (ref
        .read(favouritesMealsProvider.notifier)
        .toggleFavIcon(widget.mealItem)) {
      _isFav = true;
    } else {
      setState(() {
        _isFav = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ref.read(favouritesMealsProvider.notifier)
            .toggleFavoruite(widget.mealItem);
        if (_isFav) {
          setState(() {
            _isFav = false;
          });
        } else {
          setState(() {
            _isFav = true;
          });
        }
      },
      icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation){
            return RotationTransition(turns: Tween(begin: 0.8, end: 1.0).animate(animation), child: child,);
          },
          child: Icon(_isFav ? Icons.star : Icons.star_border, key: ValueKey(_isFav),)),
    );
  }
}
