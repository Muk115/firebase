import 'package:firebase/Screens/Login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Home_page.dart';
import 'LoginOrRegisterPage.dart';

class authPage extends StatelessWidget {
  const authPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            // user is logged in
            return Homepage();
          } else{
            // user is not logged in
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
