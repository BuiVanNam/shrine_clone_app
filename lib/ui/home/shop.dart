import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shrine_clone/utils/theme.dart';
import 'package:shrine_clone/utils/extension.dart';

class ShopPage extends StatelessWidget {
  void _setupForSystemView(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1)).then((value) {
      bool darkModeOn = context.isDarkTheme();
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor:
              darkModeOn ? kBackgroundColorDark : kBackgroundColorLight,
          systemNavigationBarDividerColor:
              darkModeOn ? Colors.black : Colors.white,
          systemNavigationBarIconBrightness:
              darkModeOn ? Brightness.light : Brightness.dark));
    });
  }

  @override
  Widget build(BuildContext context) {
    _setupForSystemView(context);

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: const Text('Shop'),
      ),
      body: StaggeredGridView.countBuilder(
          padding: const EdgeInsets.all(12),
          physics: const AlwaysScrollableScrollPhysics(
              parent: const BouncingScrollPhysics()),
          crossAxisCount: 2,
          itemCount: 100,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          itemBuilder: (context, index) {
            print('$index');
            return Container(
              // height: 100, // Use for StaggeredTile.fit(1);
              color: Colors.blueGrey,
              child: Text('$index'),
            );
          },
          staggeredTileBuilder: (index) {
            double mainAxis;
            if (index.isEven) {
              mainAxis = 1.0;
            } else if (index % 3 == 0) {
              mainAxis = 1.3;
            } else {
              mainAxis = 1.8;
            }
            return StaggeredTile.count(1, mainAxis);
          }),
    );
  }
}
