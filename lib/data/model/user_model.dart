// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String id;
  final String username;
  final String email;
  final String imageLink;
  final String phoneNumber;
  final String lastSignedIn;
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.imageLink,
    required this.phoneNumber,
    required this.lastSignedIn,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      imageLink: map['imageLink'],
      phoneNumber: map['phoneNumber'],
      lastSignedIn: map['lastSignedIn'],
    );
  }
}
