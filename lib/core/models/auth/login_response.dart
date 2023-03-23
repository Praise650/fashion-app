import 'dart:convert';

import 'package:fashion_app/core/enums/user_type.dart';

LoginResponse responseModelFromJson(String str) =>
    LoginResponse.fromJson(jsonDecode(str));

String responseToJson(LoginResponse res) => jsonEncode(res.toJson());

class LoginResponse {
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
      {this.userId,
      this.phoneNumber,
      this.email,
      this.firstName,
      this.lastName,
      this.fullName,
      this.imageUrl,
      this.gender,
      this.userType,
      this.isVerified = false});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        email: json["email"],
        imageUrl: json["imageUrl"],
        fullName: json["fullName"],
        userId: json["userId"],
        firstName: json["firstName"],
        gender: json["gender"],
        isVerified: json["isVerified"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        userType: json["userType"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "imageUrl": imageUrl,
        "fullName": fullName,
        "userId": userId,
        "firstName": firstName,
        "gender": gender,
        "isVerified": isVerified,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "userType": userType,
      };
}
