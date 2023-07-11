import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final user = FirebaseAuth.instance.currentUser;
  void signOut ()async{
    await FirebaseAuth.instance.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: signOut, icon:Icon(Icons.logout) ),
        ],

      ),
      body: Center(child: Text(
        "Logged In as:${user!.email}",
      )),
    );
  }
}
