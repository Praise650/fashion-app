import 'package:fashion_app/core/enums/user_type.dart';

class LoginResponse{
  final String? userId;
  final String? phoneNumber;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? imageUrl;
  final String? gender;
  final UserType? userType;
  final bool isVerified;

  LoginResponse(
      {
    this.userId,
    this.phoneNumber,
    this.email,
    this.firstName,
    this.lastName,
    this.fullName,
    this.imageUrl,
    this.gender,
    this.userType,
    this.isVerified = false,
  });
}