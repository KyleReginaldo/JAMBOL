// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jumbled/data/model/product_model.dart';
import 'package:jumbled/data/usecase/fetch_product.dart';
import 'package:jumbled/presentation/state/product/product_cubit.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit(
    this._fetchProduct,
  ) : super(ProductDetailInitial());
  final FetchProduct _fetchProduct;

  void fetchProduct(String id) async {
    emit(ProductDetailLoading());
    final product = await _fetchProduct(id);
    if (product != null) {
      emit(ProductDetailLoaded(product));
    } else {
      emit(ProductDetailEmpty());
    }
  }
}
