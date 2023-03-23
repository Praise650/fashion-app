import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/core/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../locator.dart';
import '../../models/auth/login_response.dart';
import '../database/db_service.dart';

class AuthServiceImpl extends AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final DBService? _dbService = serviceLocator<DBService>();

  @override
  Future<User?> login({String? email, String? password}) async {
    try {
      final UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      User? user = userCredential.user;
      // DocumentSnapshot doc = await FirebaseFirestore.instance.collection("User").doc("details").get();
      // responseModelFromJson(doc.data() as String);
      return user;
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
    return null;
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
      final UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      User? user = userCredential.user;
      if(user != null) {
        await _dbService!.uploadUserDetails(
          gender: gender,
          email: email,
          acctType: acctType,
          firstName: firstName,
          phoneNumber: phoneNumber,
          uid: user.uid,
          lastName: lastName,
        );
        return user;
      }
    } catch (e) {
      print(e);
      throw Exception('Create Failed');
    }
    return null;
  }

  @override
  Future verifyEmail({String? email}) {
    // TODO: implement verifyEmail
    throw UnimplementedError();
  }
}
