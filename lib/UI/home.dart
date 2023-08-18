import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/routes/popups/create_new_account.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Login Page"),
        backgroundColor: Colors.black,
      ),
      body: _page(),
      backgroundColor: Colors.grey,
    );
  }

  // function _page will contain icon
  Widget _page() => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38.0),
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.only(top: 80), child: _icon()),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: _loginField(),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: _passwordField()),
              Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: _actionButtons())
            ],
          ),
        ),
      );

  Widget _icon() => Container(
        decoration: BoxDecoration(
          border: Border.all(
              width: 2, color: Colors.black, style: BorderStyle.solid),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.person,
          size: 130,
          color: Colors.black,
        ),
      );

  Widget _loginField() => TextField(
        controller: userNameController,
        style: const TextStyle(color: Colors.black, fontSize: 18),
        decoration: _loginPageDecoration("Username/Login ID") ,
      );

   _loginPageDecoration(String message) =>
       InputDecoration(
           focusedBorder: OutlineInputBorder(
               borderSide: const BorderSide(color: Colors.black, width: 2),
               borderRadius: BorderRadius.circular(15.5)),
           border: OutlineInputBorder(
             borderSide: const BorderSide(color: Colors.black),
             borderRadius: BorderRadius.circular(15.5),
           ),
           hintText: message);

  Widget _passwordField() => TextField(
        controller: passwordController,
        obscureText: true,
        style: const TextStyle(color: Colors.black, fontSize: 18),
        decoration: _loginPageDecoration("enter your password")
      );

  Widget _actionButtons() => Column(
        children: [
          ElevatedButton(
              onPressed: () => _checkCredentials(),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black54),
              child: const SizedBox(
                width: double.infinity,
                child: Text(
                  "Sign in",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () => {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black54),
                  child: const Text(
                    "FORGOT PASSWORD",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  )),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const SignUpScreen()))
                      },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black54,
                  ),
                  child: const Text(
                    "create new account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  )),
            ],
          ),
        ],
      );

  _checkCredentials() async {
    String email = userNameController.text;
    String password = passwordController.text.trim();

    debugPrint(email);
    debugPrint(password);
try{
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(),
          password: password);
        _showSnackBar("Login Successful", Colors.green.shade400);

    }on FirebaseAuthException catch(ex){
      debugPrint(ex.code.toString());
      _showSnackBar(ex.code.toString(), Colors.lime.shade400);

    }
  }
  void _showSnackBar(String message, Color color){
    final snackBar = SnackBar(
        content: Text(message,
            style: const TextStyle(fontSize: 20)),
        padding: const EdgeInsets.all(30.0),
        backgroundColor: color);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(builder: (context) => const DestinationPage())
