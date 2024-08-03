// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jumbled/data/datasource/datasource.dart';

class Login {
  final DataSource ds;
  Login({
    required this.ds,
  });

  Future<User?> call({required String email, required String password}) async {
    return await ds.login(email: email, password: password);
  }
}
