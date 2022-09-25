import 'package:fashion_app/ui/pages/homepage/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/res/app_string.dart';
import '../../../../core/locator.dart';
import '../../../../core/services/auth/auth_service.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CreateAccountViewModel extends BaseViewModel{
  final AuthService? _registerService = serviceLocator<AuthService>();
  bool isLoading = false;
  void createAccount({
    required String lastName,
    required String firstName,
      required String password,
    required String gender,
      required String email,
      required String acctType})async{
    User? user = await _registerService!.register(
      password: password,
      email: email,
      acctType: acctType,
      lastName: lastName,
      firstName: firstName,
      gender: gender,
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppStrings.email, user!.email.toString());
    prefs.setString(AppStrings.lastName, user.email.toString());
    prefs.setString(AppStrings.firstName, user.email.toString());
    Get.off(()=>HomePage(user));
  }

// Future<File?> selectFile({ImageSource source = ImageSource.gallery}) async {
//   PickedFile? selectFile =
//       await ImagePicker.platform.pickImage(source: source);
// }

// void uploadFile(BuildContext context) async {
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   var userEmail = sharedPreferences.getString(AppStrings.emailPref);
//   final imageResult = await FilePicker.platform.pickFiles(
//       allowMultiple: true,
//       type: FileType.custom,
//       allowedExtensions: ['png', 'jpg', 'jpeg']);
//   if (imageResult == null) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(const SnackBar(content: Text('No file selected')));
//     return null;
//   } else {
//     final path = imageResult.files.single.path;
//     final fileName = imageResult.files.single.name;
//     print(path);
//     print(fileName);
//     String? imageUrl = await uploadToFireStorage(path!);
//     final CollectionReference<Map<String, dynamic>> users = firestore
//         .collection("Chats")
//         .doc('Messages')
//         .collection(userEmail.toString());
//     users.add({
//       'email': userEmail,
//       'message': null,
//       'imageUrl': imageUrl,
//       'senderId': userEmail,
//       'timestamp': dateCreated.toString(),
//       'createdAt': dateCreated.millisecondsSinceEpoch,
//     });
//   }
// }

// Future<firebase_storage.ListResult> getImages() async {
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   var userEmail = sharedPreferences.getString(AppStrings.emailPref);
//   firebase_storage.ListResult imageResult =
//       await storage.ref('Chats/Picture/$userEmail/').listAll();
//   imageResult.items
//       .forEach((firebase_storage.Reference ref) => print('File found: $ref'));
//   return imageResult;
// }
}

class Auth {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<User?> signInGoogle() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user;

    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication _googleSignInAuthentication =
        await googleSignInAccount.authentication;
        AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: _googleSignInAuthentication.accessToken,
          idToken: _googleSignInAuthentication.accessToken,
        );
        UserCredential userCredential =
        await firebaseAuth.signInWithCredential(authCredential);

        user = userCredential.user;
        if (user != null) {
          QuerySnapshot result = await firestore
              .collection('users')
              .where("id", isEqualTo: user.uid)
              .get();
          final List<DocumentSnapshot> documents = result.docs;
          if (documents.length == 0) {
            // insert the user to our collection

            firestore.collection("users").doc(user.uid).set({
              "id": user.uid,
              "username": user.displayName,
              "profilePicture": user.photoURL
            });
          }
        }
        await Fluttertoast.showToast(msg: "Login was successful");
      } else {
        Fluttertoast.showToast(
          msg: "Login failed",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "account-exist-with-different-credetial") {
        Fluttertoast.showToast(
          msg: 'cant verify account',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18,
        );
      } else if (e.code == 'invalid-credential') {
        Fluttertoast.showToast(
          msg: 'cant verify account',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'cant verify account',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 18,
      );
    }
    return user;
  }

  Future<void> handleSignOut() async {
    _googleSignIn.disconnect();
    firebaseAuth.signOut();
  }
}
