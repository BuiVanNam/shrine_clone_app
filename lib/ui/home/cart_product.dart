import 'package:flutter/material.dart';
import 'package:shrine_clone/ui/home/shop.dart';
import 'package:shrine_clone/utils/extension.dart';

class CartProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      createRectTween: createRectTweenCenter,
      tag: tagHeroCarProduct,
      child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.white,
          //   brightness: Brightness.dark,
          //   foregroundColor: Colors.white,
          //   shadowColor: Colors.white,
          //   elevation: 0,
          // ),
          // body: SafeArea(
          //   child: Column(
          //     children: [_buildHeader(), Divider()],
          //   ),
          // ),
          ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {},
          ),
          Text(
            'Cart Product',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          )
        ],
      ),
    );
  }
}
