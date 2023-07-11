import 'package:firebase/Components/MyButton.dart';
import 'package:firebase/Components/myTextfield.dart';
import 'package:firebase/Services/auth_Services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  final Function()? onTap;
  const Loginpage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  AuthService Auth = AuthService();

  // TextEditing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  // signUseIn method
  void signUserIn () async{
    showDialog(context: context, builder: (context){
      return Center(child: CircularProgressIndicator());
    });
    try {
      // Firebase sign in
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
    );
    Navigator.pop(context);
    } on FirebaseAuthException catch (e){
      Navigator.pop(context);
      // Wrong Email
      showErrorMessage(e.code);
    }

    
  }
  void showErrorMessage(String message) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.red,
        title: Text('Incorrect Email',style: TextStyle(color: Colors.white),),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const SizedBox(height: 50,),
                // logo
                const Center(
                  child: Icon(
                    Icons.lock,
                    size: 100,
                  ),
                ),
                // welcome we've missed you
                const SizedBox(height: 50,),

                Text(
                  'Welcome back you\'ve been missed ',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16
                  ),
                ),
                const SizedBox(height: 25,),
                // username textfield
               MyTextField(
                 controller: emailController,
                 hintText: 'Username',
                 isObscure: false,
               ),
                const SizedBox(height: 10,),
                // password Textfield
               MyTextField(
                 controller: passwordController,
                 hintText: 'Password',
                 isObscure: true,
               ),

                const SizedBox(height: 25,),
                MyButton(onTap: signUserIn, text: 'Sign In',),
                const SizedBox(height: 25,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )),
                      Text('Or continue with',style: TextStyle(color: Colors.grey[700]),),
                      Expanded(child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )),
                    ],
                  ),
                ),
              const SizedBox(height: 30,),

              Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => AuthService().signInWithGoogle(),
                    child: Image.asset('lib/assets/google.png',
                      height: 40,),
                  ),
                  const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){},
                    child: Image.asset('lib/assets/apple(1).png',
                      height: 40,),
                  ),
                ],
          ),

                const SizedBox(height: 20,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        color: Colors.grey[700]
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register now?',
                        style: TextStyle(
                          color: Colors.blue
                        ),
                      ),
                    ),

                ],)



                // signin button
                // or continue with google or apple
                // not a member? register

              ],
            ),
          ),
        ),
      ),
    );
  }
}
