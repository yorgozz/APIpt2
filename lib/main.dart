import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/presentation/screens/sign_up.dart';
import 'package:task6/provider/property_provider.dart';
import 'presentation/screens/home_page_screen.dart';
import 'presentation/screens/sign_in.dart';
import 'package:task6/provider/completeProfileProvider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CompleteProfileProvider>(
          create: (context) => CompleteProfileProvider(),
        ),
        ChangeNotifierProvider<PropertyProvider>(
          create: (context) => PropertyProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Your App',
        initialRoute: '/home',
        routes: {
          '/signin': (context) => SignInPage(),
          '/home': (context) => HomePageScreen(),
          '/signup': (context) => SignUpPage(),
        },
      ),
    );
  }
}
