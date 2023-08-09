import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task6/Navigation/navi.dart';
import 'package:task6/models/userModel.dart';
import 'package:task6/presentation/shared_widgets/GlobError.dart';
import '../service/FirebaseHelper.dart';

class CurrentUserProvider with ChangeNotifier {
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchCurrentUser() async {
    print('update current user');
    _currentUser = await FirebaseService().fetchCurrentUserDetails();
    notifyListeners();
  }

  Future<void> annulCurrentUser() async {
    print('annuled current user');
    _currentUser = null;
    notifyListeners();
  }

  Future<void> handleLogin(
      BuildContext context, String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      fetchCurrentUser();
      Navi.toHome(context);
      notifyListeners();
    } catch (e) {
      print('Error: ${e.toString()}');
      if (e is FirebaseAuthException) {
        ErrorSnackbar.showError(context, 'An error occurred: ${e.message}');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> handleSignUp(BuildContext context, String email, String password,
      String firstName, String lastName) async {
    try {
      _isLoading = true;
      notifyListeners();

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        UserModel userModel = UserModel(
          email: email.trim(),
          firstName: firstName.trim(),
          lastName: lastName.trim(),
          userId: user.uid,
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set(userModel.toMap());
        fetchCurrentUser();
      } else {
        return null;
      }
      Navi.toHome(context);
    } catch (e) {
      if (e is FirebaseAuthException) {
        ErrorSnackbar.showError(context, 'An error occurred: ${e.message}');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
