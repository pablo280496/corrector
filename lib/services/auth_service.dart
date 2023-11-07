import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto/home/home_view.dart';



class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> createUser(data, context) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => homePage())));
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Sign Up Failed"),
              content: Text(e.toString()),
            );
          });
    }
  }

  Future<void> loginUser(data, context) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => homePage())));
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Login Failed"),
              content: Text(e.toString()),
            );
          });
    }
  }
}