// // import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:get/get.dart';
// import 'package:vitas_uc/vitasproject/view/bet/fight_homescreen.dart';
// import 'package:vitas_uc/vitasproject/view/cashin/cashin_homescreen.dart';
// import 'package:vitas_uc/vitasproject/view/cashout/cashout_homescreen.dart';
// import 'package:vitas_uc/vitasproject/view/models/loginmodel.dart';

// class LoginButton extends StatefulWidget {
//   //const LoginButton({super.key});
//   String? passwordc1;
//   String? passwordc2;
//   String? passwordc3;
//   LoginButton({
//     this.passwordc1,
//     this.passwordc2,
//     this.passwordc3,
//   });

//   @override
//   State<LoginButton> createState() =>
//       _LoginButtonState(passwordc1, passwordc2, passwordc3);
// }

// class _LoginButtonState extends State<LoginButton> {
//   String? passwordc1;
//   String? passwordc2;
//   String? passwordc3;
  
//   _LoginButtonState(this.passwordc1, this.passwordc2, this.passwordc3);

//   TextEditingController emailController = new TextEditingController();
//   TextEditingController passwordController = new TextEditingController();
//   bool visible = false;
//   bool isChecked = false;
//   late Box box1;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     print(LoginModel);
//     print(LoginModel.password);
//     // emailController.text = email!;
//     // passwordController.text = password!;
//     createBox();
//   }

//   void createBox() async {
//     box1 = await Hive.openBox('logindata');
//     getData();
//   }

//   void getData() async {
//     if (box1.get('email') != null) {
//       emailController.text = box1.get('email');
//       isChecked = true;
//       setState(() {});
//     }
//     if (box1.get('password') != null) {
//       passwordController.text = box1.get('password');
//       isChecked = true;
//       setState(() {});
//     }
//   }

//   void checkRememberMe() {
//     if (isChecked) {
//       box1.put('email', emailController.text);
//       box1.put('password', passwordController.text);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(10.0))),
//       minWidth: 360,
//       elevation: 100,
//       height: 53,
//       onPressed: () {
//         print(email);
//         print(password);
//         setState(() {
//           visible = true;
//         });

//         if (email != '' || password != '') {
//           if (passwordc1 != null || passwordc2 != null || passwordc3 != null) {
//             if (email == 'cashier1' && password == passwordc1) {
//               Get.to(CashinHomeScreen(
//                   passwordc1: passwordc1,
//                   passwordc2: passwordc2,
//                   passwordc3: passwordc3));
//             } else if (email == 'cashier2' && password == passwordc2) {
//               Get.to(CashoutHomeScreen(
//                   passwordc1: passwordc1,
//                   passwordc2: passwordc2,
//                   passwordc3: passwordc3));
//             } else if (email == 'cashier3' && password == passwordc3) {
//               Get.to(FightHomeScreen(
//                   passwordc1: passwordc1,
//                   passwordc2: passwordc2,
//                   passwordc3: passwordc3));
//             } else {
//               showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       ),
//                       icon: Icon(Icons.lock_open),
//                       title: Text('Invalid Credentials'),
//                       content: Text(
//                           'The Username or Password you entered is incorrect'),
//                       actions: [
//                         TextButton(
//                           child: Text('Ok'),
//                           onPressed: () {
//                             Get.back();
//                             emailController.clear();
//                             passwordController.clear();
//                             isChecked = false;
//                           },
//                         ),
//                       ],
//                     );
//                   });
//             }
//           } else {
//             print(passwordc1);
//             print(passwordc2);
//             print(passwordc3);
//             print(passwordController.text);
//             showDialog(
//                 context: context,
//                 builder: (context) {
//                   return AlertDialog(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     ),
//                     icon: Icon(Icons.lock_open),
//                     title: Text('Invalid Credentials'),
//                     content: Text(
//                         'The Username or Password you entered is incorrect'),
//                     actions: [
//                       TextButton(
//                         child: Text('Ok'),
//                         onPressed: () {
//                           Get.back();
//                           emailController.clear();
//                           passwordController.clear();
//                           isChecked = false;
//                         },
//                       ),
//                     ],
//                   );
//                 });
//           }
//         } else {
//           print(emailController);
//           print(passwordController);
//           showDialog(
//               context: context,
//               builder: (context) {
//                 return AlertDialog(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                   ),
//                   icon: Icon(Icons.lock_open),
//                   title: Text('Enter Username & Password'),
//                   content:
//                       Text('Please Enter Username & Password before you Login'),
//                   actions: [
//                     TextButton(
//                       child: Text('Ok'),
//                       onPressed: () {
//                         Get.back();
//                         emailController.clear();
//                         passwordController.clear();
//                         isChecked = false;
//                       },
//                     ),
//                   ],
//                 );
//               });
//         }
//         checkRememberMe();
//       },
//       child: const Text(
//         "LOGIN",
//         style: TextStyle(
//           fontSize: 20,
//           color: Colors.white,
//         ),
//       ),
//       color: Color.fromRGBO(30, 170, 241, 1),
//     );
//   }
// }
