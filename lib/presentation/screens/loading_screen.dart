import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/provider/current_user_provider.dart';
import 'package:task6/service/FirebaseHelper.dart';
import 'package:task6/Navigation/navi.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  FirebaseService _firebaseService = FirebaseService();

  @override
  void initState() {
    super.initState();
    initializeFirebaseAndNavigate();
    Provider.of<CurrentUserProvider>(context, listen: false).fetchCurrentUser();
  }

  Future<void> initializeFirebaseAndNavigate() async {
    await _firebaseService.initialize();
    print('intialize and navigate');
    await Future.delayed(Duration(seconds: 1));
    Navi.fromLoadingToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
