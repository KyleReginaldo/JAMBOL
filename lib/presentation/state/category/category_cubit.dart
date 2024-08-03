// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jumbled/data/usecase/fetch_categories.dart';

import '../../../data/model/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(
    this._fetchCategories,
  ) : super(CategoryInitial());

  final FetchCategories _fetchCategories;

  void fetchCategories() async {
    emit(CategoryLoading());
    final categories = await _fetchCategories();
    if (categories.isEmpty) {
      emit(CategoryEmpty());
    } else {
      emit(CategoryLoaded(categories));
    }
  }
}
