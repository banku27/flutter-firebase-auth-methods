import 'package:flutter/material.dart';
import 'package:flutter_firebase_methods/services/firebase_auth_methods.dart';
import 'package:flutter_firebase_methods/widget/custom_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.email!),
            Text(user.uid),
            const SizedBox(
              height: 100,
            ),
            CustomButton(
                onPressed: () {
                  context.read<FirebaseAuthMethods>().logoutUser(context);
                },
                text: "Logout")
          ],
        ),
      ),
    );
  }
}
