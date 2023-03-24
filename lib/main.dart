import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vitas_uc/vitasproject/view/cashin/cashin_betscreen.dart';
import 'package:vitas_uc/vitasproject/view/cashin/cashin_homescreen.dart';
import 'package:vitas_uc/vitasproject/view/screens/loading_screen.dart';
import 'package:vitas_uc/vitasproject/view/screens/qrscanner_screen.dart';
import 'package:http/http.dart' as http;

//tapos ko na linisin yung unused libraries next is tanggalin yung mga di nagagamit na dart file

// void main() {
//   Stripe.publishableKey =
//       'pk_test_51MlnfCJ3vDZ2gpJjiZJq6cEBe3XqkVErWYhLJEiK57MZtZE5q1ZxigAqvsPw91o673HwpDusBTtqx1XZUxdVL2lA0049ulOstY';
//   runApp(const MyApp());
// }

Future<void> main() async {
  await Hive.initFlutter();
  //WidgetsFlutterBinding.ensureInitialized();
  // Stripe.publishableKey =
  //     "pk_test_51MlnfCJ3vDZ2gpJjiZJq6cEBe3XqkVErWYhLJEiK57MZtZE5q1ZxigAqvsPw91o673HwpDusBTtqx1XZUxdVL2lA0049ulOstY";
  // await Stripe.instance.applySettings();
  await Firebase.initializeApp();
  //initilization of Firebase app

  // other Firebase service initialization

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home: LoadingScreen(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Stripe Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Stripe Demo Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             makepayment("100", "PHP");
//           },
//           child: Text("Pay"),
//         ),
//       ),
//     );
//   }

//   Map<String, dynamic>? paymentIntentData;
//   Future<void> makepayment(String amount, String currency) async {
//     try {
//       paymentIntentData = createPaymentIntent(amount, currency);
//       if (paymentIntentData != null) {
//         await Stripe.instance.initPaymentSheet(
//             paymentSheetParameters: SetupPaymentSheetParameters(
//           // applyPay: true,
//           googlePay: PaymentSheetGooglePay(merchantCountryCode: 'PH'),
//           merchantDisplayName: "vitas",
//           customerId: paymentIntentData!['customer'],
//           paymentIntentClientSecret: paymentIntentData!['client_secret'],
//           customerEphemeralKeySecret: paymentIntentData!['ephemeralkey'],
//         ));
//         displayPaymentSheet();
//       }
//     } catch (e, s) {
//       print("EXCEPTION === $e$s");
//     }
//   }

//   createPaymentIntent(String amount, String currency) async {
//     try {
//       Map<String, dynamic> body = {
//         'amount': calculateAmount(amount),
//         'currency': currency,
//         'payment_method_types[]': 'card',
//       };
//       var response = await http.post(
//         Uri.parse("http://api.stripe.com/v1/payment_intents"),
//         body: body,
//         headers: {
//           'Authorization':
//               "Bearer sk_test_51MlnfCJ3vDZ2gpJjmsC7nZq54ZuCMmK7tJCKtQm4dDh0RFtqOR3Q4ic3e5VsHsbW7eYkJWsC3vn3rZkdZshsvdfb00HK36zSU0",
//           'Content-Type': 'application/x-www-form-urlencoded',
//         },
//       );
//       return jsonDecode(response.body);
//     } catch (err) {
//       print("error charging user $err");
//     }
//   }

//   void displayPaymentSheet() async {
//     try {
//       await Stripe.instance.presentPaymentSheet();
//     } on Exception catch (e) {
//       if (e is StripeException) {
//         print("error from stripe $e");
//       } else {
//         print("Unforeseen error $e");
//       }
//     } catch (e) {
//       print("exception === $e");
//     }
//   }

//   calculateAmount(String amount) {
//     final a = (int.parse(amount)) * 100;
//     return a.toString();
//   }
// }
