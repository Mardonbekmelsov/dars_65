import 'package:flutter/material.dart';

class ProductModel  extends ChangeNotifier{
  String id;
  String productName;
  String description;
  String category;
  double rating;
  double price;
  String firstColorImage;
  String secondColorImage;
  String thirdColorImage;
  bool isLiked;

  ProductModel(
      {required this.id,
      required this.productName,
      required this.description,
      required this.category,
      required this.rating,
      required this.price,
      required this.firstColorImage,
      required this.secondColorImage,
      required this.thirdColorImage,
      required this.isLiked});
}
