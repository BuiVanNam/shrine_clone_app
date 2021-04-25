import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrine_clone/model/home_model.dart';
import 'package:shrine_clone/model/product.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.select<HomeModel, Category>((value) {
      return value.currentCategory;
    });

    return Drawer(
        child: Container(
      child: ListView(
        padding: EdgeInsets.only(top: 50),
        children: [
          _buildMenu(context, Icons.ac_unit, "All", Category.all),
          _buildMenu(context, Icons.hot_tub, "Summer", Category.summer),
          _buildMenu(context, Icons.short_text, "Short", Category.short),
          _buildMenu(context, Icons.api, "Hat", Category.hat),
        ],
      ),
    ));
  }

  Widget _buildMenu(
      BuildContext context, IconData icon, String title, Category category) {
    Category currentCategory =
        Provider.of<HomeModel>(context, listen: false).currentCategory;

    return ListTile(
      leading: Icon(icon),
      selected: currentCategory == category,
      title: Text(
        '$title',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
      onTap: () {
        Navigator.pop(context);
        Provider.of<HomeModel>(context, listen: false)
            .setCurrentCategory(category);
      },
    );
  }
}
