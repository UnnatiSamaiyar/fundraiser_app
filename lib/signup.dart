import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fundraiser_app/innovatorhome.dart';
import 'package:fundraiser_app/investorhome.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController(); // Added
  TextEditingController name = TextEditingController(); // Added
  String category = 'Innovator'; // Added
  String errorMessage = '';

  signUp() async {
    if (password.text != confirmPassword.text) {
      // Added
      setState(() {
        errorMessage = 'Passwords do not match';
      });
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      if (category == "Investor") {
        Get.offAll(InvestorScreen());
      } else {
        Get.offAll(InnovatorScreen());
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: name, // Added
              decoration: InputDecoration(hintText: 'Enter name'), // Added
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: 'Enter email'),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(hintText: 'Enter password'),
              obscureText: true, // Added
            ),
            TextField(
              controller: confirmPassword, // Added
              decoration:
                  InputDecoration(hintText: 'Confirm password'), // Added
              obscureText: true, // Added
            ),
            DropdownButton<String>(
              // Added
              value: category,
              onChanged: (String? newValue) {
                setState(() {
                  category = newValue!;
                });
              },
              items: <String>['Innovator', 'Investor']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ElevatedButton(onPressed: signUp, child: Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}
