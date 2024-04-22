import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_methods/constants.dart';
import 'package:flutter_firebase_methods/firebase_options.dart';
import 'package:flutter_firebase_methods/screens/homescreen.dart';
import 'package:flutter_firebase_methods/screens/login_screen.dart';
import 'package:flutter_firebase_methods/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Firebase Methods',
        debugShowCheckedModeBanner: false,
        theme: systemDarkTheme.copyWith(
          primaryColor: primaryColorDark,
        ),
        home: const AuthStateChanges(),
      ),
    );
  }
}

class AuthStateChanges extends StatelessWidget {
  const AuthStateChanges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const HomeScreen();
    }
    return const LoginScreen();
  }
}
