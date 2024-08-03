// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:jumbled/data/model/category_model.dart';

class ProductModel {
  final String id;
  final String productName;
  final CategoryModel category;
  final DateTime createdAt;
  final int quantity;
  final int? sold;
  final double? rating;
  final double price;
  final double? discount;
  final DateTime releaseDate;
  final String imageLink;
  ProductModel({
    required this.id,
    required this.productName,
    required this.category,
    required this.createdAt,
    required this.quantity,
    this.sold,
    this.rating,
    required this.price,
    this.discount,
    required this.releaseDate,
    required this.imageLink,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      productName: map['productName'],
      category: map['category'],
      createdAt: DateTime.parse(map['createdAt']),
      quantity: map['quantity'],
      price: map['price'],
      releaseDate: DateTime.parse(map['releaseDate']),
      sold: map['sold'],
      rating: map['rating'],
      discount: map['discount'],
      imageLink: map['imageLink'],
    );
  }
}
