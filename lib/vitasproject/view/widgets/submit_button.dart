import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../screens/sign_in.dart';

class SubmitButton extends StatefulWidget {
  TextEditingController? emailcontroller = TextEditingController();
  TextEditingController? newPasscontroller = TextEditingController();
  String? passwordc1;
  String? passwordc2;
  String? passwordc3;
  SubmitButton(
      {this.emailcontroller,
      this.newPasscontroller,
      this.passwordc1,
      this.passwordc2,
      this.passwordc3});

  @override
  State<SubmitButton> createState() => _SubmitButtonState(
      emailcontroller, newPasscontroller, passwordc1, passwordc2, passwordc3);
}

class _SubmitButtonState extends State<SubmitButton> {
  TextEditingController? emailcontroller = TextEditingController();
  TextEditingController? newPasscontroller = TextEditingController();
  String? passwordc1;
  String? passwordc2;
  String? passwordc3;
  _SubmitButtonState(this.emailcontroller, this.newPasscontroller,
      this.passwordc1, this.passwordc2, this.passwordc3);
  bool isObscure = true;

  void forgotPassword() {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              icon: Icon(Icons.lock_open),
              title: Text('Forgot Password'),
              content: Text('Enter Your New Password: '),
              actions: [
                TextFormField(
                  controller: newPasscontroller,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isObscure,
                ),
                TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    if (emailcontroller!.text == 'cashier1') {
                      passwordc1 = newPasscontroller!.text;
                      Get.to(SignIn(
                          passwordc1: passwordc1,
                          passwordc2: passwordc2,
                          passwordc3: passwordc3));
                    } else if (emailcontroller!.text == 'cashier2') {
                      passwordc2 = newPasscontroller!.text;
                      Get.to(SignIn(
                          passwordc1: passwordc1,
                          passwordc2: passwordc2,
                          passwordc3: passwordc3));
                    } else if (emailcontroller!.text == 'cashier3') {
                      passwordc3 = newPasscontroller!.text;
                      Get.to(SignIn(
                          passwordc1: passwordc1,
                          passwordc2: passwordc2,
                          passwordc3: passwordc3));
                    }
                  },
                ),
              ],
            );
          });
    } catch (e) {
      if (emailcontroller!.text.isEmpty) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              icon: Icon(Icons.lock_open),
              title: Text('Invalid Credentials'),
              content: Text(
                  'Please enter your username before you reset your password.'),
              actions: [
                TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Get.back();
                    emailcontroller!.clear();
                  },
                ),
              ],
            );
          },
        );
      } else if (emailcontroller!.text != 'cashier1' ||
          emailcontroller!.text != 'cashier2' ||
          emailcontroller!.text != 'cashier3') {
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
                  'The username you entered is not assigned to a registered user. Please check and try again or contact support on ibayadsupport@ibayad.com'),
              actions: [
                TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    // Navigator.pop(context);
                    // emailcontroller.clear();

                    Get.back();
                    emailcontroller!.clear();
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
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      minWidth: 360,
      elevation: 100,
      // height: 53,
      height: MediaQuery.of(context).size.height / 12,
      onPressed: () {
        /*
        if (_formKey.currentState!.validate()) {
          passwordReset();
        }    */

        forgotPassword();
      },
      child: Text(
        'SUBMIT',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      color: Color.fromRGBO(30, 170, 241, 1),
    );
  }
}



/*  final _auth = FirebaseAuth.instance;


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
  }  */
