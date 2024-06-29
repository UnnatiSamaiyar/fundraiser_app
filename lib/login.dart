import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fundraiser_app/forgot.dart';
import 'package:fundraiser_app/innovatorhome.dart';
import 'package:fundraiser_app/investorhome.dart';
import 'package:fundraiser_app/signup.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.text, password: password.text);
      
      // Retrieve user category from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();
      
      String category = userDoc['category'];
      if (category == 'Investor') {
        Get.offAll(InvestorScreen());
      } else {
        Get.offAll(InnovatorScreen());
      }
    } catch (e) {
      // Handle error
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: email,
                decoration: InputDecoration(hintText: 'Enter email'),
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(hintText: 'Enter password'),
                obscureText: true,
              ),
              ElevatedButton(onPressed: signIn, child: Text("Login")),
              ElevatedButton(onPressed: () => Get.to(Signup()), child: Text("Register Now")),
              ElevatedButton(onPressed: () => Get.to(Forgot()), child: Text("Forgot Password"))
            ],
          ),
        ));
  }
}
