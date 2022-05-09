// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/account_model.dart';
import '../welcome/welcome.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var visible = true;
  var visible2 = false;
  var _signupDetails = const SignupModel(
      name: "", email: "", password: "");
  final _form = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  Future<void> signupButton_handler() async {
    _form.currentState!.validate();
    _form.currentState!.save();

    setState(() {
      visible = false;
      visible2 = true;
    });
      var response = await http.post(
        Uri.https('challengee-api.herokuapp.com', '/api/register',
            {'q': '{http}'}),
        body: ({
          "name": _signupDetails.name,
          "email": _signupDetails.email,
          "password": _signupDetails.password,
        }));
    if (response.statusCode == 200) {
      setState(() {
        visible = true;
        visible = false;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
    }
    }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 150.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _form,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[300],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter names",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                              onSaved: (value) {
                                _signupDetails = SignupModel(
                                  name: value.toString(),
                                  email: _signupDetails.email,
                                  password: _signupDetails.password,
                                  
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[300],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter email",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                              onSaved: (value) {
                                _signupDetails = SignupModel(
                                  name: _signupDetails.name,
                                  email: value.toString(),
                                  password: _signupDetails.password,
                                  
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[300],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter password",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                              onSaved: (value) {
                                _signupDetails = SignupModel(
                                  name: _signupDetails.name,
                                  email: _signupDetails.email,
                                  password: value.toString(),
                              
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: GestureDetector(
                            onTap: signupButton_handler,
                            child: Column(
                              children: [
                                Visibility(
                                  visible: visible,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.black,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Sign up",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: visible2,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.grey[100],
                                    ),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
