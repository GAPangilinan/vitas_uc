import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vitas_uc/ignoreThisFolder/services/loading_auth.dart';
import 'package:vitas_uc/vitasproject/screens/sign_in.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  String _email = '';
  bool visible = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();

  final _auth = FirebaseAuth.instance;

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Forgot Password'),
            content: Text(
                'An email has been sent to the supplied email address. Follow the instruction in the email to reset your password'),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Ok'),
                onPressed: () {
                  //Navigator.of(context).pop(context);
                  //openDialog();
                  passwordReset();
                },
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              icon: Icon(Icons.lock_open),
              title: Text('Forgot Password'),
              content: Text(
                  'An email has been sent to the supplied email address. Follow the instruction in the email to reset your password.'),
              actions: [
                TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    // Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //     builder: (BuildContext context) =>
                    //         SignIn()));
                    Get.to(SignIn());
                  },
                ),
              ],
            );
          });
    } on FirebaseAuthException catch (e) {
      //print(e);
      if (emailcontroller.text.isEmpty) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              icon: Icon(Icons.lock_open),
              title: Text('Invalid Credentials'),
              content:
                  Text('Please enter your username/password before you login.'),
              actions: [
                TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    // Navigator.pop(context);
                    // emailcontroller.clear();

                    Get.back();
                    emailcontroller.clear();
                  },
                ),
              ],
            );
          },
        );
      } else if (e.message.toString() ==
          'There is no user record corresponding to this identifier. The user may have been deleted.') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              icon: Icon(Icons.lock_open),
              title: Text('Forgot Password'),
              content: Text(
                  'The email address you entered is not assigned to a registered user. Please check and try again or contact support on ibayadsupport@ibayad.com'),
              actions: [
                TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    // Navigator.pop(context);
                    // emailcontroller.clear();

                    Get.back();
                    emailcontroller.clear();
                  },
                ),
              ],
            );
          },
        );
      } else if (e.message.toString() ==
          'The email address is badly formatted.') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              icon: Icon(Icons.lock_open),
              title: Text('Forgot Password'),
              content: Text(
                  'The email address or domain name you entered is not valid. Valid entries include: someone@example.com'),
              actions: [
                TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    // Navigator.pop(context);
                    // emailcontroller.clear();

                    Get.back();
                    emailcontroller.clear();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(62, 58, 57, 1),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Row(
                      children: [
                        Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontSize: 28,
                            color: Color.fromRGBO(102, 102, 102, 1),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.blueAccent,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: TextFormField(
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 16.0, top: 16.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                          ),
                          // validator: (value) {
                          //   if (value!.length == 0) {
                          //     return "Email cannot be empty";
                          //   }
                          //   if (!RegExp(
                          //           "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          //       .hasMatch(value)) {
                          //     return ("Please enter a valid email");
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          // onSaved: (value) {
                          //   emailcontroller.text = value!;
                          // },
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            minWidth: 360,
                            elevation: 100,
                            height: 53,
                            onPressed: () {
                              // _auth.sendPasswordResetEmail(email: _email);
                              // createAlertDialog(context);
                              // Navigator.of(context).pop();

                              if (_formKey.currentState!.validate()) {
                                passwordReset();
                              }
                            },
                            child: Text(
                              'SUBMIT',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            color: Color.fromRGBO(30, 170, 241, 1),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.blueAccent,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
