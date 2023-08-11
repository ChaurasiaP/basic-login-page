import 'package:flutter/material.dart';
import 'package:login_page/database/userData.dart';
import 'package:login_page/routes/popups/create_new_account.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _username;
  String? _password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Login Page"),
        backgroundColor: Colors.black,
      ),
      body:  _page(),
      backgroundColor: Colors.grey,
      );
  }

  Widget _page()=> Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38.0),
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.only(top: 80),
              child: _icon()),

            Padding(padding: const EdgeInsets.only(top:30, bottom: 10),
            child: _loginField(),),

            Padding(padding: const EdgeInsets.only(top:30, bottom: 10),
            child: _passwordField()),

            Padding(padding: const EdgeInsets.only(top: 30),
            child:  _actionButtons())
          ],
        ),
      ),
    );



  Widget _icon() => Container(
    decoration: BoxDecoration(
      border: Border.all(width: 2, color: Colors.black, style: BorderStyle.solid),
      shape: BoxShape.circle,
    ),
    child: const Icon(Icons.person, size: 130, color: Colors.black,),
  );

  Widget _loginField() => TextField(
    style: const TextStyle(
        color: Colors.black,
        fontSize: 18),
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(15.5)
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(15.5),
      ),

        hintText: "Username/Login ID"
    ),
    onChanged: (String value){
      setState(() {
        _username = value;
      });
    },
  );

  Widget _passwordField() =>
      TextField(
        obscureText: true,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 18),
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(15.5)
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(15.5),
              ),
              hintText: "enter your password"
          ),
          onChanged: (String value){
            setState(() {
              _password = value;
            });
          }
      );

  Widget _actionButtons() =>
      Column(
        children: [
          ElevatedButton(
              onPressed: () => _checkCredentials(_username!, _password!),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black54
              ),
              child: const SizedBox(
                width: double.infinity,
                child: Text("Sign in",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18
                ),),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: ()=>{
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black54
                  ),
                  child: const Text(
                    "FORGOT PASSWORD",
                    style:  TextStyle(color: Colors.white, fontSize: 10),
                  )),
              ElevatedButton(
                  onPressed: ()=>{
                    Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const SignUpScreen()))
                    },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black54,
                  ),
                  child: const Text(
                    "create new account",
                    style:  TextStyle(color: Colors.white, fontSize: 10,),
                  )),
            ],
          ),
        ],
      );

  _showInputData() {
    debugPrint(_username);
    debugPrint(_password);
  }

  _checkCredentials(String userName, String password){
    for(int i = 0; i<UserData.emails.length; i++) {
      if (userName == UserData.emails[i]) {
        if (_password == UserData.passwords[i]) {
          _showInputData();
          final snackBar = SnackBar(
              content: const Text(
                  "Login Successful!", style: TextStyle(fontSize: 20)),
              padding: const EdgeInsets.all(30.0),
              backgroundColor: Colors.green.shade400);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          debugPrint('invalid credentials');
          final snackBar = SnackBar(
              content: const Text(
                  "Invalid credentials!", style: TextStyle(fontSize: 20)),
              padding: const EdgeInsets.all(30.0),
              backgroundColor: Colors.red.shade400);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          break;
        }
      } else {
        debugPrint('You are not registered, Create new account!');
        final snackBar = SnackBar(
            content: const Text("You are not registered, Create new account!",
                style: TextStyle(fontSize: 20)),
            padding: const EdgeInsets.all(30.0),
            backgroundColor: Colors.yellow.shade400);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        break;
      }
    }
  }
}
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(builder: (context) => const DestinationPage())