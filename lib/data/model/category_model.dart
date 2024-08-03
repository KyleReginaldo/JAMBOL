// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  final String id;
  final String categoryName;
  final DateTime createdAt;
  CategoryModel({
    required this.id,
    required this.categoryName,
    required this.createdAt,
  });
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      categoryName: map['categoryName'],
      createdAt: DateTime.parse(
        map['createdAt'],
      ),
    );
  }
}
