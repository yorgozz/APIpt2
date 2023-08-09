import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task6/models/userModel.dart';

class FirebaseService {
  CollectionReference usersRef = FirebaseFirestore.instance.collection('users');
  static final FirebaseService _instance = FirebaseService._internal();

  factory FirebaseService() => _instance;

  FirebaseService._internal();

  Future<void> initialize() async {
    await Firebase.initializeApp();
  }

  Future<UserModel?> fetchCurrentUserDetails() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        print('user diff than null');
        CollectionReference usersCollection =
            FirebaseFirestore.instance.collection('users');

        DocumentSnapshot userSnapshot =
            await usersCollection.doc(user.uid).get();

        if (userSnapshot.exists) {
          UserModel userModel =
              UserModel.fromJson(userSnapshot.data() as Map<String, dynamic>);
          print('raddet userModel');
          return userModel;
        }
      }
      print('raddet null');
      return null;
    } catch (e) {
      print('Error checking user and retrieving data: $e');
      return null;
    }
  }
}
