import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginpage/Home_Page.dart';
import 'package:loginpage/main.dart';
import 'package:loginpage/reusable_Widgets/reuseable.dart';
import 'package:loginpage/utils/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _passwordTextController = TextEditingController();
    TextEditingController _emailTextController = TextEditingController();
    TextEditingController _usernameTextController = TextEditingController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Signup",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              reusableTextField("Name", Icons.person_2_outlined, false,
                  _usernameTextController),
              const SizedBox(
                height: 10,
              ),
              reusableTextField("Email", Icons.person_2_outlined, false,
                  _emailTextController),
              const SizedBox(
                height: 10,
              ),
              reusableTextField("Password", Icons.lock_outline, true,
                  _passwordTextController),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  var username = _usernameTextController.text.trim();
                  var email = _emailTextController.text.trim();
                  var password = _passwordTextController.text.trim();
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    print("Created New Account");
                    FirebaseFirestore.instance.collection("users").doc().set({
                      'username': username,
                      'email': email,
                      'dateCreated': DateTime.now()
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                },
                style: ElevatedButton.styleFrom(
                    // Set the background color of the button
                    ),
                child: const Text(
                  "Signup",
                  style: TextStyle(
                    color: Colors
                        .black, // Set the text color to white or any other desired color
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?",
                      style: TextStyle(color: Colors.white70)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage(
                                    title: 'HomePage',
                                  )));
                    },
                    child: const Text(
                      " Login ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
