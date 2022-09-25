import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/core/services/database/db_service.dart';

class DBServiceImpl extends DBService {
  FirebaseFirestore store = FirebaseFirestore.instance;

  @override
  Future getUserMessage({String? recipientID}) {
    // TODO: implement getUserMessage
    throw UnimplementedError();
  }

  @override
  Future sendMessage({String? message, String? recipientID}) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }

  @override
  Future uploadUserDetails(
      {String? acctType,
      String? firstName,
      String? phoneNumber,
      String? lastName,
      String? email,
      String? gender}) async {
    await store.collection('User').doc('details').set({
      'accountType': acctType,
      'firstName': firstName,
      'phoneNumber': phoneNumber,
      'lastName': lastName,
      'gender': gender,
      'email':email
    });
  }
}
