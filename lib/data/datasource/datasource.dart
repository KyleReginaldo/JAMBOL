import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jumbled/data/model/product_model.dart';
import 'package:jumbled/dto/create_user_dto.dart';

import '../model/category_model.dart';

abstract class DataSource {
  Future<List<CategoryModel>> fetchCategories();
  Future<List<ProductModel>> fetchProducts({
    String? categoryId,
  });
  Future<User?> register({
    required CreateUserDto createUserDto,
  });
  Future<User?> login({
    required String email,
    required String password,
  });

  Future<ProductModel?> fetchProduct(String id);
}

class DataSourceImpl implements DataSource {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  @override
  Future<List<CategoryModel>> fetchCategories() async {
    final snap = await db.collection('category').get();
    return snap.docs.map((e) => CategoryModel.fromMap(e.data())).toList();
  }

  @override
  Future<List<ProductModel>> fetchProducts({
    String? categoryId,
  }) async {
    List<ProductModel> products = [];
    final snap = categoryId != null
        ? await db
            .collection('product')
            .where('category', isEqualTo: categoryId)
            .get()
        : await db.collection('product').get();
    for (int i = 0; i < snap.docs.length; i++) {
      final categorySnap = await db
          .collection('category')
          .doc(snap.docs[i].data()['category'])
          .get();
      final data = snap.docs[i].data();
      data['category'] = CategoryModel.fromMap(categorySnap.data()!);
      products.add(ProductModel.fromMap(data));
    }
    return products;
  }

  @override
  Future<User?> register({
    required CreateUserDto createUserDto,
  }) async {
    final userCreds = await auth
        .createUserWithEmailAndPassword(
      email: createUserDto.email,
      password: createUserDto.password,
    )
        .then((user) async {
      if (user.user != null) {
        await auth.currentUser?.updateDisplayName(createUserDto.userName);
        await db.collection('user').doc(user.user?.uid).set({
          "id": user.user?.uid,
          "username": createUserDto.userName,
          "phoneNumber": createUserDto.phoneNumber,
          "email": createUserDto.email,
          "createdAt": DateTime.now().toString(),
          "imageLink": null,
          "lastSignedIn": null,
        });
        return user;
      }
      return user;
    });
    return userCreds.user;
  }

  @override
  Future<User?> login({required String email, required String password}) async {
    final userCreds =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return userCreds.user;
  }

  @override
  Future<ProductModel?> fetchProduct(String id) async {
    final snap = await db.collection('product').doc(id).get();
    final data = snap.data();
    final categorySnap =
        await db.collection('category').doc(data?['category'] ?? '').get();
    data?['category'] = CategoryModel.fromMap(categorySnap.data()!);
    if (data != null) {
      return ProductModel.fromMap(data);
    } else {
      return null;
    }
  }
}
