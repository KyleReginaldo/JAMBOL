// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jumbled/data/usecase/fetch_products.dart';

import '../../../data/model/product_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(
    this._fetchProducts,
  ) : super(ProductInitial());
  final FetchProducts _fetchProducts;

  void fetchProducts({
    String? categoryId,
  }) async {
    emit(ProductLoading());
    final products = await _fetchProducts(categoryId: categoryId);

    if (products.isEmpty) {
      emit(ProductEmpty());
    } else {
      emit(ProductLoaded(products));
    }
  }
}
