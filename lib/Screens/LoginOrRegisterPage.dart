import 'package:firebase/Screens/Login_page.dart';
import 'package:flutter/material.dart';

import 'Register_Page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({Key? key}) : super(key: key);

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  // initially show login page
  bool showLoginPage = true;

  // toggle to move between login and signup
  void toggleLogin (){
    setState(() {
      showLoginPage = !showLoginPage;
    });

  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return Loginpage(onTap: toggleLogin);
    } else {
      return RegisterPage(onTap: toggleLogin,);
    }
  }
}
