import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:vitas_uc/vitasproject/screens/cashin_homescreen.dart';
import 'package:vitas_uc/vitasproject/screens/cashout_homescreen.dart';
import 'package:vitas_uc/vitasproject/screens/fight_homescreen.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool visible = false;
  bool isChecked = false; //boolean for checkbox of remember me
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  late Box box1;

  void createBox() async {
    box1 = await Hive.openBox('logindata');
    getData();
  }

  void getData() async {
    if (box1.get('email') != null) {
      emailController.text = box1.get('email');
      isChecked = true;
      setState(() {});
    }
    if (box1.get('password') != null) {
      passwordController.text = box1.get('password');
      isChecked = true;
      setState(() {});
    }
  }

  void checkRememberMe() {
    if (isChecked) {
      box1.put('email', emailController.text);
      box1.put('password', passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      key: _formkey,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      minWidth: 360,
      elevation: 100,
      height: 53,
      onPressed: () {
        setState(() {
          visible = true;
        });
        signIn(emailController.text, passwordController.text);
        checkRememberMe();
      },
      child: Text(
        "LOGIN",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      color: Color.fromRGBO(30, 170, 241, 1),
    );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('vitas')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('cashierstatus') == "Cash In") {
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => CashinHomeScreen(),
          //   ),
          // );
          Get.to(CashinHomeScreen());
        } else if (documentSnapshot.get('cashierstatus') == "Cash Out") {
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => CashoutHomeScreen(),
          //   ),
          // );
          Get.to(CashoutHomeScreen());
        } else if (documentSnapshot.get('cashierstatus') == "Bet") {
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => FightHomeScreen(),
          //   ),
          // );
          Get.to(FightHomeScreen());
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          //print('No user found for that email.');
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
                    Text('The username or password you entered is incorrect'),
                actions: [
                  TextButton(
                    child: Text('Ok'),
                    onPressed: () {
                      // Navigator.pop(context);
                      // emailController.clear();
                      // passwordController.clear();
                      // isChecked = false;

                      Get.back();
                      emailController.clear();
                      passwordController.clear();
                      isChecked = false;
                    },
                  ),
                ],
              );
            },
          );
          //   else if (e.code == 'wrong-password') {
          //   print('Wrong password provided for that user.');
          // }
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
                    'The email address or domain you entered is not valid. Valid entries include: someone@example.com'),
                actions: [
                  TextButton(
                    child: Text('Ok'),
                    onPressed: () {
                      // Navigator.pop(context);
                      // emailController.clear();
                      // passwordController.clear();
                      // isChecked = false;

                      Get.back();
                      emailController.clear();
                      passwordController.clear();
                      isChecked = false;
                    },
                  ),
                ],
              );
            },
          );
        } else if (emailController.text.isEmpty ||
            passwordController.text.isEmpty) {
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
                    'Please enter your username/password before you login.'),
                actions: [
                  TextButton(
                    child: Text('Ok'),
                    onPressed: () {
                      // Navigator.pop(context);
                      // emailController.clear();
                      // passwordController.clear();
                      // isChecked = false;

                      Get.back();
                      emailController.clear();
                      passwordController.clear();
                      isChecked = false;
                    },
                  ),
                ],
              );
            },
          );
        }
      }
    }
  }
}
