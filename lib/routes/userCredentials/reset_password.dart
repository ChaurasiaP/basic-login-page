import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      resizeToAvoidBottomInset: false,

      body: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Column(
          children: [

            const Icon(Icons.password_rounded,
            size: 130,
            color: Colors.black),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                decoration: _resetPswdDecoration("enter your registered email ID"),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                  onPressed: (){
                      FirebaseAuth.instance.sendPasswordResetEmail(
                          email: emailController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black
                  ),
                  child: const Text("Submit") ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey,
    );
  }
  _resetPswdDecoration(String message) =>
      InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(15.5)),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(15.5),
          ),
          hintText: message);
}
