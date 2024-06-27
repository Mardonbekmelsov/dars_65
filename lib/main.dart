import 'package:dars_65/controllers/cart_controller.dart';
import 'package:dars_65/controllers/products_controller.dart';
import 'package:dars_65/views/screens/home_paage.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return ProductsController();
        }),
        ChangeNotifierProvider(create: (context){
          return CartController();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
