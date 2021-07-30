import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_screen/pages/login_screen.dart';
import 'package:registration_screen/providers/auth_provider.dart';
import 'package:registration_screen/providers/user_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
