import 'package:dars_65/models/product_model.dart';

class RoomModel {
  String id;
  String roomName;
  String imageUrl;
  List<ProductModel> roomProducts;

  RoomModel({
    required this.id,
    required this.roomName,
    required this.imageUrl,
    required this.roomProducts,
  });
}
