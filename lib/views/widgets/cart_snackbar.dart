import 'package:dars_65/controllers/cart_controller.dart';
import 'package:dars_65/models/product_model.dart';
import 'package:dars_65/views/screens/cart_screen.dart';
import 'package:dars_65/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

SnackBar buildSnackBar(BuildContext context) {
  return SnackBar(
    duration: Duration(hours: 1),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Cart",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).clearSnackBars();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Provider.of<CartController>(context, listen: false)
                .cart
                .products
                .values
                .toList()
                .isNotEmpty
            ? Container(
                height: 300,
                child: ListView.builder(
                    itemCount:
                        Provider.of<CartController>(context, listen: false)
                            .cart
                            .products
                            .values
                            .toList()
                            .length,
                    itemBuilder: (context, index) {
                      final product =
                          Provider.of<CartController>(context, listen: false)
                              .cart
                              .products
                              .values
                              .toList()[index]['product'];
                      return ChangeNotifierProvider<ProductModel>.value(
                        value: product,
                        builder: (context, child) {
                          return ProductItem();
                        },
                      );
                    }),
              )
            : Text(
                "Mahsulotlar yo'q",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
        Row(
          children: [
            Text(
              "Total",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "${Provider.of<CartController>(context, listen: false).cart.totalPrice}",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).clearSnackBars();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
              child: const Text(
                "Checkout Cart",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ))
      ],
    ),
    padding: EdgeInsets.all(16),
    backgroundColor: Colors.white,
    // showCloseIcon: true,
    // closeIconColor: Colors.black,
  );
}
