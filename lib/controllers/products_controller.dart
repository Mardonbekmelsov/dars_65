import 'package:dars_65/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductsController extends ChangeNotifier {
  final List<ProductModel> _list = [
    ProductModel(
      id: '1',
      productName: 'Modern Sofa',
      description: 'A comfortable modern sofa with a sleek design.',
      category: 'Living Room',
      rating: 4.5,
      price: 799.99,
      firstColorImage: 'assets/images/stol.png',
      secondColorImage: 'assets/images/stol.png',
      thirdColorImage: 'assets/images/stol.png',
      isLiked: false,
    ),
    ProductModel(
      id: '2',
      productName: 'Wooden  Table',
      description: 'A stylish coffee table made from high-quality wood.',
      category: 'Living Room',
      rating: 4.7,
      price: 249.99,
      firstColorImage: 'assets/images/stol.png',
      secondColorImage: 'assets/images/stol.png',
      thirdColorImage: 'assets/images/stol.png',
      isLiked: false,
    ),
    ProductModel(
      id: '3',
      productName: 'Ergonomic  Chair',
      description: 'An ergonomic chair designed for maximum comfort.',
      category: 'Office',
      rating: 4.8,
      price: 299.99,
      firstColorImage: 'assets/images/stol.png',
      secondColorImage: 'assets/images/stol.png',
      thirdColorImage: 'assets/images/stol.png',
      isLiked: false,
    ),
    ProductModel(
      id: '4',
      productName: 'Dining Table Set',
      description: 'A complete dining set with a table and four chairs.',
      category: 'Dining Room',
      rating: 4.6,
      price: 599.99,
      firstColorImage: 'assets/images/stol.png',
      secondColorImage: 'assets/images/stol.png',
      thirdColorImage: 'assets/images/stol.png',
      isLiked: false,
    ),
    ProductModel(
      id: '5',
      productName: 'King Size Bed',
      description: 'A luxurious king-size bed with a comfortable mattress.',
      category: 'Bedroom',
      rating: 4.9,
      price: 999.99,
      firstColorImage: 'assets/images/stol.png',
      secondColorImage: 'assets/images/stol.png',
      thirdColorImage: 'assets/images/stol.png',
      isLiked: false,
    ),
    ProductModel(
      id: '6',
      productName: 'Bookshelf',
      description: 'A spacious bookshelf with multiple compartments.',
      category: 'Living Room',
      rating: 4.5,
      price: 199.99,
      firstColorImage: 'assets/images/stol.png',
      secondColorImage: 'assets/images/stol.png',
      thirdColorImage: 'assets/images/stol.png',
      isLiked: false,
    ),
    ProductModel(
      id: '7',
      productName: 'Recliner Sofa',
      description: 'A comfortable recliner sofa perfect for relaxation.',
      category: 'Living Room',
      rating: 4.7,
      price: 899.99,
      firstColorImage: 'assets/images/stol.png',
      secondColorImage: 'assets/images/stol.png',
      thirdColorImage: 'assets/images/stol.png',
      isLiked: false,
    ),
    ProductModel(
      id: '8',
      productName: 'Wardrobe',
      description: 'A spacious wardrobe with multiple shelves and drawers.',
      category: 'Bedroom',
      rating: 4.6,
      price: 499.99,
      firstColorImage: 'assets/images/stol.png',
      secondColorImage: 'assets/images/stol.png',
      thirdColorImage: 'assets/images/stol.png',
      isLiked: false,
    ),
    ProductModel(
      id: '9',
      productName: 'Office Desk',
      description: 'A modern office desk with ample storage space.',
      category: 'Office',
      rating: 4.4,
      price: 349.99,
      firstColorImage: 'assets/images/stol.png',
      secondColorImage: 'assets/images/stol.png',
      thirdColorImage: 'assets/images/stol.png',
      isLiked: false,
    ),
    ProductModel(
      id: '10',
      productName: 'Outdoor Patio Set',
      description: 'A durable patio set perfect for outdoor lounging.',
      category: 'Outdoor',
      rating: 4.5,
      price: 699.99,
      firstColorImage: 'assets/images/stol.png',
      secondColorImage: 'assets/images/stol.png',
      thirdColorImage: 'assets/images/stol.png',
      isLiked: false,
    ),
    ProductModel(
      id: '11',
      productName: 'TV Stand',
      description: 'A modern TV stand with ample storage for media devices.',
      category: 'Living Room',
      rating: 4.6,
      price: 179.99,
      firstColorImage: 'assets/images/stol.png',
      secondColorImage: 'assets/images/stol.png',
      thirdColorImage: 'assets/images/stol.png',
      isLiked: false,
    ),
    ProductModel(
      id: '12',
      productName: 'Bar Stools',
      description: 'A set of stylish bar stools for your kitchen or bar area.',
      category: 'Kitchen',
      rating: 4.7,
      price: 99.99,
      firstColorImage: 'assets/images/stol.png',
      secondColorImage: 'assets/images/stol.png',
      thirdColorImage: 'assets/images/stol.png',
      isLiked: false,
    ),
    ProductModel(
      id: '13',
      productName: 'Nightstand',
      description: 'A sleek nightstand with drawers for bedside storage.',
      category: 'Bedroom',
      rating: 4.5,
      price: 129.99,
      firstColorImage: 'assets/images/stol.png',
      secondColorImage: 'assets/images/stol.png',
      thirdColorImage: 'assets/images/stol.png',
      isLiked: false,
    ),
    ProductModel(
      id: '14',
      productName: 'Sectional Sofa',
      description: 'A spacious sectional sofa perfect for large living rooms.',
      category: 'Living Room',
      rating: 4.8,
      price: 1199.99,
      firstColorImage: 'assets/images/stol.png',
      secondColorImage: 'assets/images/stol.png',
      thirdColorImage: 'assets/images/stol.png',
      isLiked: false,
    ),
    ProductModel(
      id: '15',
      productName: 'Kids Bunk Bed',
      description: 'A fun and practical bunk bed for kids.',
      category: 'Kids',
      rating: 4.7,
      price: 499.99,
      firstColorImage: 'assets/images/stol.png',
      secondColorImage: 'assets/images/stol.png',
      thirdColorImage: 'assets/images/stol.png',
      isLiked: false,
    ),
  ];

  List<ProductModel> get list {
    return [..._list];
  }

  void changeLike(String id) {
    for(var product in _list){
      if(product.id==id){
        product.isLiked=!product.isLiked;
      }
    }
    notifyListeners();
  }
}