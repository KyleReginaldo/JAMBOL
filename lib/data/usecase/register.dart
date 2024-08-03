// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jumbled/data/datasource/datasource.dart';
import 'package:jumbled/dto/create_user_dto.dart';

class Register {
  final DataSource ds;
  Register({
    required this.ds,
  });

  Future<User?> call({
    required CreateUserDto createUserDto,
  }) async {
    return await ds.register(createUserDto: createUserDto);
  }
}
