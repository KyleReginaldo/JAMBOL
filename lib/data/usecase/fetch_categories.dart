// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:jumbled/data/model/category_model.dart';

import '../datasource/datasource.dart';

class FetchCategories {
  final DataSource ds;
  FetchCategories({
    required this.ds,
  });

  Future<List<CategoryModel>> call() async {
    return await ds.fetchCategories();
  }
}
