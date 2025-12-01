import 'package:flutter/material.dart';
import 'package:registration_app_flutter_firebase/login.dart';
import 'package:registration_app_flutter_firebase/service.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool isvisible=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "create an account ,it's free",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Username",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),

              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return ("User name is required");
                  }
                  return null;
                },
                controller: usernamecontroller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Email",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return ("Email is required");
                  }
                  if (!value.contains("@")) {
                    return ("Email is not valid");
                  }
                  ;
                },
                controller: emailcontroller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Password",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              TextFormField(   validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return ("Invalid Password");
                  }
                  if (value.length<=8) {
                    return ("Password must contain 8 characters");
                  }
                  return null;
                },
                obscureText: isvisible,
                controller: passwordcontroller,
                decoration: InputDecoration(
                suffixIcon: IconButton(onPressed: () {
                  setState(() {
                    isvisible=!isvisible;
                  });
                }, icon: isvisible?Icon(Icons.visibility_off):Icon(Icons.visibility)),


                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Confirm Password",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              TextFormField(  validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return ("Enter Password");
                  }
                  if(value!=passwordcontroller.text)
                  {
                    return("Invalid Password");
                  }
              },
                controller: confirm_password,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 70),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    foregroundColor: Colors.white,
                    side: BorderSide(color: Colors.black),
                  ),
                  onPressed: () {
                    if(formkey.currentState!.validate()){
                    register(
                      Username: usernamecontroller.text,
                      Email: emailcontroller.text,
                      Password: passwordcontroller.text,
                      Confirmpassword: confirm_password.text,
                      context: context,
                    );}

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                  child: Text("Sign up", style: TextStyle(fontSize: 20)),
                ),
              ),
              SizedBox(height: 180),
              Row(
                children: [
                  Text(
                    "          Already have an account?",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
