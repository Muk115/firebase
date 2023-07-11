import 'package:firebase/Services/auth_Services.dart';
import 'package:flutter/material.dart';
import 'package:firebase/Components/MyButton.dart';
import 'package:firebase/Components/myTextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  // TextEditing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();



  // signUseIn method
  void signUserUp () async{
    showDialog(context: context, builder: (context){
      return Center(child: CircularProgressIndicator());
    });
    try {
      // Check if password is equal to confirm password
      if (passwordController.text == confirmpasswordController.text){

        // Firebase sign in
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      }else {
        // passwords don't match
        showErrorMessage('Password don\'t match');

      }
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

                const SizedBox(height: 20,),
                // logo
                const Center(
                  child: Icon(
                    Icons.lock,
                    size: 100,
                  ),
                ),
                // welcome we've missed you
                const SizedBox(height: 20,),

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
                const SizedBox(height: 10,),
                // confirm password
                MyTextField(
                  controller: confirmpasswordController,
                  hintText: 'Confirm Password',
                  isObscure: true,
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot password ?',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 25,),
                MyButton(onTap: signUserUp, text: 'Sign Up',),
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
                      onTap: ()=> AuthService().signInWithGoogle(),
                      child: Image.asset('lib/assets/google.png',
                        height: 40,),
                    ),
                    SizedBox(width: 10,),
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
                      'Already have an account?',
                      style: TextStyle(
                          color: Colors.grey[700]
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Login now?',
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
