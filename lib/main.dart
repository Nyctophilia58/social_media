import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/pages/home_page.dart';
import 'package:social_media/pages/profile_page.dart';
import 'package:social_media/pages/users_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_media/theme/theme_provider.dart';
import 'auth/login_or_register.dart';
import 'firebase_options.dart';
import 'auth/auth_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/login_or_register': (context) => const LoginOrRegister(),
        '/home_page': (context) => HomePage(),
        '/profile_page': (context) => ProfilePage(),
        '/users_page': (context) => const UsersPage(),
      },
      // theme: darkMode,
    );
  }
}
