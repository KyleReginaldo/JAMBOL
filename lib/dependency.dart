import 'package:get_it/get_it.dart';
import 'package:jumbled/data/usecase/fetch_categories.dart';
import 'package:jumbled/data/usecase/fetch_product.dart';
import 'package:jumbled/data/usecase/fetch_products.dart';
import 'package:jumbled/data/usecase/login.dart';
import 'package:jumbled/data/usecase/register.dart';
import 'package:jumbled/presentation/state/auth/auth_cubit.dart';
import 'package:jumbled/presentation/state/category/category_cubit.dart';
import 'package:jumbled/presentation/state/product/product_cubit.dart';
import 'package:jumbled/presentation/state/product/product_detail/product_detail_cubit.dart';

import 'data/datasource/datasource.dart';

final sl = GetIt.instance;

Future init() async {
  sl.registerFactory(() => ProductCubit(sl()));
  sl.registerFactory(() => CategoryCubit(sl()));
  sl.registerFactory(() => AuthCubit(sl(), sl()));
  sl.registerFactory(() => ProductDetailCubit(sl()));

  sl.registerLazySingleton(() => FetchProduct(ds: sl()));
  sl.registerLazySingleton(() => Register(ds: sl()));
  sl.registerLazySingleton(() => FetchCategories(ds: sl()));
  sl.registerLazySingleton(() => FetchProducts(ds: sl()));
  sl.registerLazySingleton(() => Login(ds: sl()));

  sl.registerLazySingleton<DataSource>(() => DataSourceImpl());
}
