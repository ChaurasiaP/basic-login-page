import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Create New Account"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: SafeArea(
        child: Container(
          margin:  EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38.0),
            child: Column(
              children: [

                // add user icon
                Icon(Icons.person_add_rounded, size: 130),
                // add user icon ends

                // email input text field
                const TextField(
                  decoration: InputDecoration(
                      labelText:  "Email",
                      hintText: "enter your email"
                  ),
                ),
                // email input text field ends

                // password input text field
                const TextField(
                  decoration: InputDecoration(
                      labelText:  "Password",
                      hintText: "enter new password"
                  ),
                ),
                // password input text field ends

                // confirm password input text field
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText:  "Confirm Password",
                      hintText: "re-enter your password"
                  ),
                ),
                // confirm password input text field ends


                Padding(
                  padding: const EdgeInsets.all(38.0),

                  // submit button
                  child: ElevatedButton(
                      onPressed: () => {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54,
                      ),
                      child: const SizedBox(
                        width: double.infinity,
                        child: Text("Create new account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18
                          ),),
                      )),
                  // submit button ends

                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey,
    );
  }
}
