import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vitas_uc/vitasproject/view/cashin/cashin_homescreen.dart';
import 'package:vitas_uc/vitasproject/view/cashout/cashout_homescreen.dart';
import 'package:vitas_uc/vitasproject/view/bet/fight_homescreen.dart';
import 'package:vitas_uc/vitasproject/view/constants.dart';
import 'package:vitas_uc/vitasproject/view/screens/forgot_password.dart';
import 'package:hive/hive.dart';
import 'package:vitas_uc/vitasproject/view/widgets/loginbutton.dart';

class SignIn extends StatefulWidget {
  String? passwordc1;
  String? passwordc2;
  String? passwordc3;
  SignIn({
    this.passwordc1,
    this.passwordc2,
    this.passwordc3,
  });

  @override
  _SignInState createState() =>
      _SignInState(passwordc1, passwordc2, passwordc3);
}

class _SignInState extends State<SignIn> {
  String? passwordc1;
  String? passwordc2;
  String? passwordc3;
  _SignInState(this.passwordc1, this.passwordc2, this.passwordc3);

  bool _isObscure3 = true;
  bool visible = false;
  bool isChecked = false; //boolean for checkbox of remember me
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  late Box box1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createBox();
  }

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
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Alert'),
                content: const Text('Do you want to Exit?'),
                actions: [
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    child: const Text('No'),
                  ),
                  ElevatedButton(
                    onPressed: () => SystemNavigator.pop(),
                    child: const Text('Exit'),
                  ),
                ],
              );
            });
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },

      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(62, 58, 57, 1),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 1,
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                decoration: bgImage,
                child: Center(
                  child: Container(
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 0),
                          Container(
                            // height: 100,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: bgLogo,
                          ),
                          SizedBox(height: 50),
                          Row(
                            children: [
                              Text(
                                'Cashier Login',
                                style: CLStyle,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          //BLUE-BORDER LINE
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Container(
                              decoration: bbDecoration,
                            ),
                          ),
                          SizedBox(height: 20),
                          //EMAIL TEXTFORMFIELD
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Email',
                              enabled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 16.0, top: 16.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: /*new*/
                                    const BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(10),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: /*new*/
                                    const BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(10),
                              ),
                            ),
                            // keyboardType: ,
                          ),
                          SizedBox(height: 20),
                          //PASSWORD TEXTFORMFIELD
                          TextFormField(
                            controller: passwordController,
                            obscureText: _isObscure3,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: Icon(_isObscure3
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure3 = !_isObscure3;
                                    });
                                  }),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Password',
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
                          ),
                          Row(
                            children: [
                              //CHECKBOX
                              Checkbox(
                                value: isChecked,
                                activeColor: Colors.blue,
                                tristate: false,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                              //REMEMBER ME TEXT BUTTON
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    isChecked = !isChecked;
                                  });
                                },
                                child: const Text(
                                  'Remember Me',
                                  style: TextStyle(
                                    color: Color.fromRGBO(102, 102, 102, 1),
                                  ),
                                ),
                              ),
                              //FORGOT PASSWORD TEXT BUTTON
                              Padding(
                                padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                                child: TextButton(
                                  child: const Text(
                                    'Forgot Password',
                                    style: fpassTextStyle,
                                  ),
                                  onPressed: () {
                                    Get.to(ForgotPasswordPage(
                                        // passwordc1: passwordc1,
                                        // passwordc2: passwordc2,
                                        // passwordc3: passwordc3
                                        ));
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          //LOGIN BUTTON
                          // LoginButton(
                          //   emailController: emailController,
                          //   passwordController: passwordController,
                          //   passwordc1: passwordc1,
                          //   passwordc2: passwordc2,
                          //   passwordc3: passwordc3,
                          // ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            minWidth: 360,
                            elevation: 100,
                            // height: 53,
                            height: MediaQuery.of(context).size.height / 12,
                            onPressed: () async {
                              setState(() {
                                visible = true;
                              });
                              //FIREBASE SIGNIN
                              signIn(emailController.text,
                                  passwordController.text);
                              print(emailController.text);
                              print(passwordController.text);

                              // if (emailController!.text != '' ||
                              //     passwordController!.text != '') {
                              //   print(emailController!.text);
                              //   if (passwordc1 != null ||
                              //       passwordc2 != null ||
                              //       passwordc3 != null) {
                              //     if (emailController!.text == 'cashier1' &&
                              //         passwordController!.text == passwordc1) {
                              //       Get.to(CashinHomeScreen(
                              //           passwordc1: passwordc1,
                              //           passwordc2: passwordc2,
                              //           passwordc3: passwordc3));
                              //     } else if (emailController!.text ==
                              //             'cashier2' &&
                              //         passwordController!.text == passwordc2) {
                              //       Get.to(CashoutHomeScreen(
                              //           passwordc1: passwordc1,
                              //           passwordc2: passwordc2,
                              //           passwordc3: passwordc3));
                              //     } else if (emailController!.text ==
                              //             'cashier3' &&
                              //         passwordController!.text == passwordc3) {
                              //       Get.to(FightHomeScreen(
                              //           passwordc1: passwordc1,
                              //           passwordc2: passwordc2,
                              //           passwordc3: passwordc3));
                              //     } else {
                              //       showDialog(
                              //           context: context,
                              //           builder: (context) {
                              //             return AlertDialog(
                              //               shape: RoundedRectangleBorder(
                              //                 borderRadius: BorderRadius.all(
                              //                     Radius.circular(20.0)),
                              //               ),
                              //               icon: Icon(Icons.lock_open),
                              //               title: Text('Invalid Credentials'),
                              //               content: Text(
                              //                   'The Username or Password you entered is incorrect'),
                              //               actions: [
                              //                 TextButton(
                              //                   child: Text('Ok'),
                              //                   onPressed: () {
                              //                     Get.back();
                              //                     emailController!.clear();
                              //                     passwordController!.clear();
                              //                     isChecked = false;
                              //                   },
                              //                 ),
                              //               ],
                              //             );
                              //           });
                              //     }
                              //   } else {
                              //     showDialog(
                              //         context: context,
                              //         builder: (context) {
                              //           return AlertDialog(
                              //             shape: RoundedRectangleBorder(
                              //               borderRadius: BorderRadius.all(
                              //                   Radius.circular(20.0)),
                              //             ),
                              //             icon: Icon(Icons.lock_open),
                              //             title: Text('Invalid Credentials'),
                              //             content: Text(
                              //                 'The Username or Password you entered is incorrect'),
                              //             actions: [
                              //               TextButton(
                              //                 child: Text('Ok'),
                              //                 onPressed: () {
                              //                   Get.back();
                              //                   emailController!.clear();
                              //                   passwordController!.clear();
                              //                   isChecked = false;
                              //                 },
                              //               ),
                              //             ],
                              //           );
                              //         });
                              //   }
                              // } else {
                              //   showDialog(
                              //       context: context,
                              //       builder: (context) {
                              //         return AlertDialog(
                              //           shape: RoundedRectangleBorder(
                              //             borderRadius: BorderRadius.all(
                              //                 Radius.circular(20.0)),
                              //           ),
                              //           icon: Icon(Icons.lock_open),
                              //           title:
                              //               Text('Enter Username & Password'),
                              //           content: Text(
                              //               'Please Enter Username & Password before you Login'),
                              //           actions: [
                              //             TextButton(
                              //               child: Text('Ok'),
                              //               onPressed: () {
                              //                 Get.back();
                              //                 emailController!.clear();
                              //                 passwordController!.clear();
                              //                 isChecked = false;
                              //               },
                              //             ),
                              //           ],
                              //         );
                              //       });
                              // }
                              checkRememberMe();
                            },
                            child: const Text(
                              "LOGIN",
                              style: loginButtonTextStyle,
                            ),
                            color: Color.fromRGBO(30, 170, 241, 1),
                          ),
                          SizedBox(height: 20),
                          //BLUE-BORDER LINE
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Container(
                              decoration: bbDecoration,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //],
    );
  }

// Method for determining who is the current log in user
  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('vitas')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('cashierstatus') == "Cash In") {
          var fullName = documentSnapshot.get('fullname');
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => CashinHomeScreen(),
          //   ),
          // );
          Get.to(CashinHomeScreen(fullName: fullName));
        } else if (documentSnapshot.get('cashierstatus') == "Cash Out") {
          var fullName = documentSnapshot.get('fullname');
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => CashoutHomeScreen(),
          //   ),
          // );
          Get.to(CashoutHomeScreen(fullName: fullName));
        } else if (documentSnapshot.get('cashierstatus') == "Bet") {
          var fullName = documentSnapshot.get('fullname');
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => FightHomeScreen(),
          //   ),
          // );
          Get.to(FightHomeScreen(fullName: fullName));
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
