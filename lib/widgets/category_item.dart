import '../screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final id;
  final title;
  final color;
  CategoryItem(this.id, this.title, this.color);

  void selectCategory(ctx) {
    // ******* one option ********
    // Navigator.of(ctx).push(MaterialPageRoute(
    //   builder: (_) {
    //     return CategortMealsScreen(id, title);
    //   },
    // ));
    // ******* other option ********
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
        // color: color,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
