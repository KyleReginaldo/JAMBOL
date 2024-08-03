// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:jumbled/data/model/product_model.dart';

import '../datasource/datasource.dart';

class FetchProducts {
  final DataSource ds;
  FetchProducts({
    required this.ds,
  });

  Future<List<ProductModel>> call({
    String? categoryId,
  }) async {
    return await ds.fetchProducts(categoryId: categoryId);
  }
}
