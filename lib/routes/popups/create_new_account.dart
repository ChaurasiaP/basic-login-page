import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void _createAccount() async{
    String uName = usernameController.text.trim();
    String password = passwordController.text.trim();
    String cnfPassword = confirmPasswordController.text.trim();

    if(uName == "" || password == "" || cnfPassword == ""){
      debugPrint("Please fill all the details");
      final snackBar = SnackBar(content: const Text(
          "Please fill all the details",
          style: TextStyle(fontSize: 20)),
          padding: const EdgeInsets.all(30.0),
          backgroundColor: Colors.red.shade400);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

    }else if(cnfPassword != password){
      debugPrint("Password and Confirm Password do not match");
      final snackBar = SnackBar(content: const Text(
          "Password and Confirm Password do not match",
          style: TextStyle(fontSize: 20)),
          padding: const EdgeInsets.all(30.0),
          backgroundColor: Colors.redAccent);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: uName, password: password);
        debugPrint("User Created");
        final snackBar = SnackBar(content: const Text(
            "You are Successfully Registered with us!",
            style: TextStyle(fontSize: 20)),
            padding: const EdgeInsets.all(30.0),
            backgroundColor: Colors.green.shade400);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }on FirebaseAuthException catch(ex){
        final snackBar = SnackBar(content:Text(
          ex.code.toString(),
            style: const TextStyle(fontSize: 20)),
            padding: const EdgeInsets.all(30.0),
            backgroundColor: Colors.red.shade400);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

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
                const Icon(Icons.person_add_rounded, size: 130),
                // add user icon ends

                // email input text field
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(
                          color: Colors.black54
                      ),
                      labelText:  "Email",
                      hintText: "enter your email",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                  )
                  ),
                ),
                // email input text field ends

                // password input text field
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(
                          color: Colors.black54
                      ),
                      labelText:  "Password",
                      hintText: "enter new password",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    )
                  ),
                ),
                // password input text field ends

                // confirm password input text field
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black54
                    ),
                      labelText:  "Confirm Password",
                      hintText: "re-enter your password",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      )
                  ),
                ),
                // confirm password input text field ends


                Padding(
                  padding: const EdgeInsets.all(38.0),

                  // submit button
                  child: ElevatedButton(
                      onPressed: () => {
                        _createAccount()
                      },
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
