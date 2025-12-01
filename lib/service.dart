import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:registration_app_flutter_firebase/home.dart';

Future<void> register({
  required String Username,
  required String Email,
  required String Password,
  required String Confirmpassword,
  required BuildContext context
}) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: Email, password: Password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("User created successfully")));
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(e.toString()) ));

  }
}
Future<void> login({
  required String Email,
  required String Password,
  required BuildContext context
}) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: Email, password: Password);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logined successfully")));
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(e.toString()) ));

  }
}
Future<void> forgot({
  required String Email,
  required BuildContext context
}) async {
  try {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: Email);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Email send succesfully")));
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(e.toString()) ));

  }
}
