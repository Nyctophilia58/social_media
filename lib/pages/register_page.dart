import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/components/my_button.dart';
import 'package:social_media/components/my_textfield.dart';

import '../helper/helper_functions.dart';

class RegisterPage extends StatefulWidget {

  final void Function()? onTap;

  RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void registerUser() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    if (passwordController.text != confirmPasswordController.text) {
      Navigator.pop(context);

      displayMessageToUser("Passwords do not match.", context);
    }
    else{
      try{
        UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        createUserDocument(userCredential);

        if (context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);

        displayMessageToUser(e.code, context);
      }
    }
  }

  Future<void> createUserDocument(UserCredential? userCredential) async{
    if(userCredential != null && userCredential.user != null){
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': usernameController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 80,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),

                const SizedBox(height: 25),

                const Text(
                  "M I N I M A L",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 50),

                MyTextField(
                    hintText: "Username",
                    obscureText: false,
                    controller: usernameController
                ),

                const SizedBox(height: 10),

                MyTextField(
                    hintText: "Email",
                    obscureText: false,
                    controller: emailController
                ),

                const SizedBox(height: 10),


                MyTextField(
                    hintText: "Password",
                    obscureText: true,
                    controller: passwordController
                ),

                const SizedBox(height: 10),

                MyTextField(
                    hintText: "Confirm Password",
                    obscureText: true,
                    controller: confirmPasswordController
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                MyButton(
                  text: "Register",
                  onTap: registerUser,
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),

                    const SizedBox(width: 5),

                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login here.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}