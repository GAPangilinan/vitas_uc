import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vitas/screens/authenticate/forgot_password.dart';
import 'package:vitas/services/auth.dart';
import 'package:vitas/shared/constants.dart';
import 'package:vitas/shared/loading.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../services/loading_auth.dart';

class SignIn extends StatefulWidget {
  //const SignIn({super.key});

  final Function? toggleView;
  SignIn({this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isObscure3 = true;
  bool isChecked = false; //boolean for checkbox of remember me
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //Text field state
  String email = '';
  String password = '';
  String error = '';
  String error2 = '';

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
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Color.fromRGBO(62, 58, 57, 1),
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
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
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          children: [
                            Text(
                              'Cashier Login',
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(10),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(10),
                          ),
                        ),
                        // validator: (val) =>
                        //     val!.isEmpty ? 'Enter a valid email' : null,
                        // onChanged: (val) {
                        //   setState(() => email = val);
                        // },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        obscureText: _isObscure3,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure3
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isObscure3 = !_isObscure3;
                              });
                            },
                          ),
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
                        // onChanged: (val) {
                        //   setState(() => password = val);
                        // },
                      ),
                      Row(
                        children: [
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
                          Text(
                            'Remember Me',
                            style: TextStyle(
                              color: Color.fromRGBO(102, 102, 102, 1),
                            ),
                          ),
                          SizedBox(width: 85),
                          TextButton(
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                color: Color.fromRGBO(102, 102, 102, 1),
                                decoration: TextDecoration.underline,
                                decorationThickness: 1.8,
                              ),
                            ),
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordPage())),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Column(
                        children: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            minWidth: 360,
                            elevation: 100,
                            height: 53,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  loading = true;
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim());
                                  checkRememberMe();
                                } on FirebaseAuthException catch (e) {
                                  if (emailController.text.isEmpty ||
                                      passwordController.text.isEmpty) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                          ),
                                          icon: Icon(Icons.lock_open),
                                          title: Text('Invalid Credentials'),
                                          content: Text(
                                              'Please enter your username/password before you login.'),
                                          actions: [
                                            TextButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                                emailController.clear();
                                                passwordController.clear();
                                                isChecked = false;
                                                loading = false;
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                          ),
                                          icon: Icon(Icons.lock_open),
                                          title: Text('Invalid Credentials'),
                                          content: Text(
                                              'The username or password you entered is incorrect'),
                                          actions: [
                                            TextButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                                emailController.clear();
                                                passwordController.clear();
                                                isChecked = false;
                                                loading = false;
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                          ),
                                          icon: Icon(Icons.lock_open),
                                          title: Text('Forgot Password'),
                                          content: Text(
                                              'The email address or domain you entered is not valid. Valid entries include: someone@example.com'),
                                          actions: [
                                            TextButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                                emailController.clear();
                                                passwordController.clear();
                                                isChecked = false;
                                                loading = false;
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }

                                  // if (result == null) {
                                  //   setState(() {
                                  //     error =
                                  //         'Please fill up email and password.';
                                  //     loading = false;
                                  //   });
                                  // }

                                  // if (result != null) {
                                  //   loading = false;
                                  //   //error2 = e.toString();
                                  //   showDialog(
                                  //     context: context,
                                  //     builder: (context) {
                                  //       return AlertDialog(
                                  //         shape: RoundedRectangleBorder(
                                  //           borderRadius: BorderRadius.all(
                                  //               Radius.circular(20.0)),
                                  //         ),
                                  //         icon: Icon(Icons.lock_open),
                                  //         title: Text('Invalid Credentials'),
                                  //         content: Text(
                                  //             'The username and password you entered is incorrect'),
                                  //         actions: [
                                  //           TextButton(
                                  //             child: Text('Ok'),
                                  //             onPressed: () {
                                  //               Navigator.pop(context);
                                  //               emailController.clear();
                                  //             },
                                  //           ),
                                  //         ],
                                  //       );
                                  //     },
                                  //   );
                                  // }
                                }
                              }
                            },
                            child: Text(
                              'LOGIN',
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
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                      SizedBox(height: 12),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                      Text(
                        error2,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
