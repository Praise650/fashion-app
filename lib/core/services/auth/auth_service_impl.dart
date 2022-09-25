import 'package:fashion_app/core/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../locator.dart';
import '../database/db_service.dart';

class AuthServiceImpl extends AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final DBService? _dbService = serviceLocator<DBService>();

  @override
  Future<User?> login({String? email, String? password}) async {
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      return user.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      throw Exception('Login Failed');
    }
  }

  @override
  Future<User?> register(
      {String? acctType,
      String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? phoneNumber,
      String? gender}) async {
    try {
      final UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      await _dbService!.uploadUserDetails(
        gender: gender,
        email: email,
        acctType: acctType,
        firstName: firstName,
        phoneNumber: phoneNumber,
        lastName: lastName,
      );
      return user.user;
    } catch (e) {
      print(e);
      throw Exception('Create Failed');
    }
  }

  @override
  Future verifyEmail({String? email}) {
    // TODO: implement verifyEmail
    throw UnimplementedError();
  }
}
