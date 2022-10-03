import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:stacked/stacked.dart';

class CloudService with ReactiveServiceMixin{
  // static final _log = getLogger((FirebaseService).toString());
  static final _fsInstance = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final String _usersCollectionPath = "Users";
  final String _cartCollectionPath = "Cart";
  final String _photoCollectionPath = "Photos";
  final String _parentsCollectionPath = "Parents";
  final String _studentsCollectionPath = "Students";

  ///Collection path
  late final CollectionReference<Map<String, dynamic>> _usersCollection;
  late final CollectionReference<Map<String, dynamic>> _cartCollection;
  late final CollectionReference<Map<String, dynamic>> _photoCategoriesCollection;
  late final CollectionReference<Map<String, dynamic>> _parentsCollection;

  /// Collection Reference
  CollectionReference<Map<String, dynamic>> get classesCollection => _usersCollection;

  CollectionReference<Map<String, dynamic>> get photosCollection => _cartCollection;

  CollectionReference<Map<String, dynamic>> get photoCategoryCollection => _photoCategoriesCollection;

  CollectionReference<Map<String, dynamic>> get parentsCollection => _parentsCollection;


  initialize()async{}
}