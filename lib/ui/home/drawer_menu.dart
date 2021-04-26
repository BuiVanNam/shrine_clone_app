import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrine_clone/main.dart';
import 'package:shrine_clone/model/home_model.dart';
import 'package:shrine_clone/model/product.dart';
import 'package:shrine_clone/utils/shared_preferences.dart';

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
          _buildMenu(context, Icons.ac_unit, "All", category: Category.all),
          _buildMenu(context, Icons.hot_tub, "Summer",
              category: Category.summer),
          _buildMenu(context, Icons.short_text, "Short",
              category: Category.short),
          _buildMenu(context, Icons.api, "Hat", category: Category.hat),
          Divider(
            height: 30,
          ),
          _buildMenu(context, Icons.logout, "Logout"),
        ],
      ),
    ));
  }

  void _actionLogout(BuildContext context) async {
    LoginUtils.logout().then((_) {
      Navigator.pushReplacementNamed(context, routerLogin);
    });
  }

  Widget _buildMenu(BuildContext context, IconData icon, String title,
      {Category? category}) {
    Category currentCategory =
        Provider.of<HomeModel>(context, listen: false).currentCategory;
    bool isLogoutItem = category == null;
    return ListTile(
      leading: Icon(icon),
      selected: currentCategory == category,
      title: Text(
        '$title',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
      onTap: () {
        Navigator.pop(context);
        if (category == null) {
          _actionLogout(context);
        } else {
          Provider.of<HomeModel>(context, listen: false)
              .setCurrentCategory(category);
        }
      },
    );
  }
}
