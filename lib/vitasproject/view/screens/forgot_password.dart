import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vitas_uc/vitasproject/view/screens/sign_in.dart';
import 'package:vitas_uc/vitasproject/view/widgets/submit_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  //const ForgotPasswordPage({super.key});
  String? passwordc1;
  String? passwordc2;
  String? passwordc3;
  ForgotPasswordPage({this.passwordc1, this.passwordc2, this.passwordc3});

  @override
  State<ForgotPasswordPage> createState() =>
      _ForgotPasswordPageState(passwordc1, passwordc2, passwordc3);
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  _ForgotPasswordPageState(this.passwordc1, this.passwordc2, this.passwordc3);
  String? passwordc1;
  String? passwordc2;
  String? passwordc3;
  String _email = '';
  bool isObscure = true;
  bool visible = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController newPasscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(62, 58, 57, 1),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            // height: MediaQuery.of(context).size.height * 1,
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
                    // height: 100,
                    height: MediaQuery.of(context).size.height * 0.2,
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
                                // width: 2.0,
                                width: MediaQuery.of(context).size.width / 200,
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
                          // keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          //SUBMIT BUTTON TO CHANGE PASSWORD
                          SubmitButton(
                            emailcontroller: emailcontroller,
                            newPasscontroller: newPasscontroller,
                            passwordc1: passwordc1,
                            passwordc2: passwordc2,
                            passwordc3: passwordc3,
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
                                // width: 2.0,
                                width: MediaQuery.of(context).size.width / 200,
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
