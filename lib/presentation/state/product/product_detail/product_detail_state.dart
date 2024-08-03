part of 'product_detail_cubit.dart';

sealed class ProductDetailState {}

final class ProductDetailInitial extends ProductDetailState {}

final class ProductDetailLoaded extends ProductDetailState {
  final ProductModel product;

  ProductDetailLoaded(this.product);
}

final class ProductDetailLoading extends ProductDetailState {}

final class ProductDetailEmpty extends ProductDetailState {}
