// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:jumbled/data/datasource/datasource.dart';

import '../model/product_model.dart';

class FetchProduct {
  final DataSource ds;
  FetchProduct({
    required this.ds,
  });

  Future<ProductModel?> call(String id) async {
    return await ds.fetchProduct(id);
  }
}
