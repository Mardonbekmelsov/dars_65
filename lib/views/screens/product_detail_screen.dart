import 'package:dars_65/controllers/cart_controller.dart';
import 'package:dars_65/controllers/products_controller.dart';
import 'package:dars_65/models/product_model.dart';
import 'package:dars_65/views/widgets/cart_snackbar.dart';
import 'package:dars_65/views/widgets/product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        centerTitle: true,
        title: const Text("Product Detail"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 200,
                  height: 280,
                  child: PageView(
                    controller: PageController(initialPage: 2),
                    children: [
                      Image.asset(
                        product.firstColorImage,
                        height: 280,
                        width: 160,
                      ),
                      Image.asset(
                        product.secondColorImage,
                        height: 280,
                        width: 160,
                      ),
                      Image.asset(
                        product.thirdColorImage,
                        height: 280,
                        width: 160,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 280,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        product.category,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Text(
                          product.productName,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Text(
                        "Price",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "\$${product.price}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const Text(
                        "Choose Colors",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 30,
                              width: 25,
                              color: Colors.yellow,
                            ),
                          ),
                          InkWell(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 30,
                              width: 25,
                              color: Colors.green,
                            ),
                          ),
                          InkWell(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 30,
                              width: 25,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow.shade800,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      product.rating.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow.shade800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  loremIpsum(words: 50),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Consumer<ProductsController>(
                      builder: (context, controller, child) {
                        return IconButton(
                          onPressed: () {
                            Provider.of<ProductsController>(context,
                                    listen: false)
                                .changeLike(product.id);
                          },
                          icon: product.isLiked
                              ? const Icon(
                                  CupertinoIcons.heart_fill,
                                  color: Colors.grey,
                                  size: 35,
                                )
                              : const Icon(
                                  CupertinoIcons.heart,
                                  color: Colors.grey,
                                  size: 35,
                                ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                    onTap: () {
                      Provider.of<CartController>(context, listen: false)
                          .addToCart(product);
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        "Add To Cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(context));
        },
        child: Container(
          padding: EdgeInsets.all(16),
          decoration:
              BoxDecoration(color: Colors.green, shape: BoxShape.circle),
          child: Icon(
            CupertinoIcons.bag,
          ),
        ),
      ),
    );
  }
}
