import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/Navigation/approutes.dart';
import 'package:task6/provider/property_provider.dart';
import 'presentation/screens/home_page_screen.dart';
import 'package:task6/provider/completeProfileProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'provider/current_user_provider.dart';
import 'Navigation/navi.dart';

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
        ChangeNotifierProvider<CurrentUserProvider>(
          create: (context) => CurrentUserProvider(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              return HomePageScreen();
            }),
        title: 'Your App',
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: AppRoutes.loading,
      ),
    );
  }
}
