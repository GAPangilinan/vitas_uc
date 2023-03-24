import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
//import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vitas_uc/vitasproject/view/constants.dart';
import 'package:vitas_uc/vitasproject/view/widgets/cancel_cashin_button.dart';
import 'package:vitas_uc/vitasproject/view/widgets/components/amount_row1.dart';
import 'package:vitas_uc/vitasproject/view/widgets/components/amount_row2.dart';
import 'package:http/http.dart' as http;
import 'package:vitas_uc/vitasproject/view/widgets/cashin_button.dart';
import 'package:vitas_uc/vitasproject/view/widgets/clear_button.dart';
import 'package:vitas_uc/vitasproject/view/widgets/components/input_amount.dart';

import '../../../main.dart';
import 'cashin_homescreen.dart';

Future<void> secondmain() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Stripe.publishableKey =
  //     "pk_test_51MlnfCJ3vDZ2gpJjiZJq6cEBe3XqkVErWYhLJEiK57MZtZE5q1ZxigAqvsPw91o673HwpDusBTtqx1XZUxdVL2lA0049ulOstY";
  // Stripe.instance.applySettings();
  // Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  // Stripe.urlScheme = 'flutterstripe';
  // await Firebase.initializeApp();
}

class CashinBetScreen extends StatelessWidget {
  static const cardReader =
      MethodChannel('com.socsi.smartposapi.card.CardReader/CardReader');
  String? passwordc1;
  String? passwordc2;
  String? passwordc3;
  String? fullName;
  String? resultcode;
  //String? cardnumber;
  //String? amountC;
  int? balance;
  int? FinalResultAmount;
  int? totalBalance = 10000;
  CashinBetScreen({
    this.resultcode,
    this.fullName,
    this.passwordc1,
    this.passwordc2,
    this.passwordc3,
    this.totalBalance,
    this.FinalResultAmount,
    /*this.amountC*/
  });

  /* Future<void> initPayment(
      {required String fullName,
      required double amountPayment,
      required BuildContext context}) async {
    // try {
    // To create a payment intent on the server
    final response = await http.post(
        Uri.parse(
            'https://us-central1-vitas-796ff.cloudfunctions.net/stripePaymentIntentRequest'),
        body: {
          'fullname': fullName,
          'amountPayment': amountPayment.toString(),
        });
    final jsonResponse = jsonDecode(response.body);
    print(jsonResponse.toString());

    // To initialize the payment sheet
    Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: jsonResponse['paymentIntent'],
      merchantDisplayName: 'VITAS',
      customerId: jsonResponse['fullname'],
      customerEphemeralKeySecret: jsonResponse['ephemeralKey'],
      googlePay:
          PaymentSheetGooglePay(testEnv: true, merchantCountryCode: 'US'),
    ));

    Stripe.instance.presentPaymentSheet();
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: const Text('Payment is successful')));
    // } catch (e) {
    //   if (e is StripeException) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text('An error occured ${e.error.localizedMessage}'),
    //       ),
    //     );
    //   } else {
    //     StripeConfigException;
    //     // ScaffoldMessenger.of(context).showSnackBar(
    //     //   SnackBar(
    //     //     content: Text('An error occured $e'),
    //     //   ),
    //     // );
    //   }
    // }
  }
*/
  getPaycardData() async {
    var response1 = await http.get(Uri.https(
        'my-json-server.typicode.com', '/schiZzyy/mockjson/paycard1'));
    var response2 = await http.get(Uri.https(
        'my-json-server.typicode.com', '/schiZzyy/mockjson/paycard2'));
    var response3 = await http.get(Uri.https(
        'my-json-server.typicode.com', '/schiZzyy/mockjson/paycard3'));

    if (resultcode == '7019-4889-5501-4231') {
      var jsonData = jsonDecode(response1.body);
      List<Paycard> paycards = [];

      for (var p in jsonData) {
        Paycard paycard = Paycard(p["cardnumber"], p["balance"].toString());
        String cardnumber = p["cardnumber"];
        balance = p["balance"];
        paycards.add(paycard);
      }

      print(paycards.length);
      return paycards;
    } else if (resultcode == '6980-7001-5563-4089') {
      var jsonData = jsonDecode(response2.body);
      List<Paycard> paycards = [];

      for (var p in jsonData) {
        Paycard paycard = Paycard(p["cardnumber"], p["balance"].toString());
        String cardnumber = p["cardnumber"];
        balance = p["balance"];
        paycards.add(paycard);
      }

      print(paycards.length);
      return paycards;
    } else if (resultcode == '6819-5619-7287-4123') {
      var jsonData = jsonDecode(response3.body);
      List<Paycard> paycards = [];

      for (var p in jsonData) {
        Paycard paycard = Paycard(p["cardnumber"], p["balance"].toString());
        String cardnumber = p["cardnumber"];
        balance = p["balance"];
        paycards.add(paycard);
      }

      print(paycards.length);
      return paycards;
    }
  }

  //final AuthService _auth = AuthService();
  final formKey = GlobalKey<FormState>();
  TextEditingController? amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final paymentController = Get.put(PaymentController());
    // return StreamProvider<List<VitasModel>?>.value(
    //   initialData: null,
    //   value: DatabaseService(uid: '').vitas,
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(62, 58, 57, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          //BACKGROUND IMAGE
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            decoration: bgImage,
            child: Column(
              children: <Widget>[
                SizedBox(height: 0),
                //LOGO
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: bgLogo,
                ),
                SizedBox(height: 0),
                //CARD ACCOUNT HEADER
                Container(
                  child: FutureBuilder(
                    future: getPaycardData(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        // amountController?.text = amountC!;
                        return Container(
                          child: Center(
                            child: Text('Loading......'),
                          ),
                        );
                      } else
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, i) {
                              if (FinalResultAmount == null) {
                                FinalResultAmount = 0;
                                var valMinAmount =
                                    balance! - FinalResultAmount!;
                                totalBalance = valMinAmount;
                              } else {
                                var balanceMinAmount =
                                    totalBalance! - FinalResultAmount!;
                                totalBalance = balanceMinAmount;
                              }
                              // Masking '#' the credit card number except last four(4) digits
                              var creditCardNumber =
                                  '${snapshot.data[i].cardnumber}';
                              var creditCardLast4Digit =
                                  creditCardNumber.substring(15);
                              var controller = new MaskedTextController(
                                  text: '', mask: '####-####-####-0000');
                              controller.updateText('$creditCardLast4Digit');

                              return ListTile(
                                title: Text(
                                    controller.text, //Mask in Card Number
                                    style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromRGBO(102, 102, 102, 1))),
                                subtitle: Text('Card Number',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color:
                                            Color.fromRGBO(102, 102, 102, 1))),
                                trailing: Text('${totalBalance}.00',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromRGBO(102, 102, 102, 1))),
                              );
                            });
                    },
                  ),
                ),
                SizedBox(height: 10),
                //BLUE-BORDER LINE
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    decoration: bbDecoration,
                  ),
                ),
                SizedBox(height: 10),
                //GREEN CASH IN TEXT
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        'CASH IN',
                        style: GreenTextStyle,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                //BLUE-BORDER LINE
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    decoration: bbDecoration,
                  ),
                ),
                SizedBox(height: 10),
                //CASH IN INFORMATION
                Row(
                  children: [
                    Text(
                      'Important:',
                      style: infoTextStyle,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'By using this cash in facility, you agree that the amount will be credited to your card with a minimum fee of (0.00).',
                  textAlign: TextAlign.justify,
                  style: infoTextStyle,
                ),
                SizedBox(height: 10),
                Text(
                  'Upon confirmation of the transaction, the amount credited to the card is non refundable and can not be reversed.',
                  textAlign: TextAlign.justify,
                  style: infoTextStyle,
                ),
                SizedBox(height: 15),
                //INPUT AMOUNT
                InputAmount(
                    amountController: amountController, formKey: formKey),
                SizedBox(height: 15),
                //ROW 1 AMOUNT BUTTONS
                AmountRow1(amountController: amountController),
                SizedBox(height: 10),
                //ROW 2 AMOUNT BUTTONS
                AmountRow2(amountController: amountController),
                SizedBox(height: 20),
                //CASH IN BUTTON
                // CashinButton(
                //   amountController: amountController,
                //   FinalResultAmount: FinalResultAmount,
                //   totalBalance: totalBalance,
                //   resultcode: resultcode,
                // ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  minWidth: 500,
                  elevation: 100,
                  // height: 53,
                  height: MediaQuery.of(context).size.height / 15,
                  onPressed: () {
                    // initPayment(
                    //     amountPayment: 100.0,
                    //     context: context,
                    //     fullName: 'Gilmer Pangilinan');
                    // if (amountController!.text.isNotEmpty) {
                    //   //ilalagay ko dito yung formula ng totalBalance from cashin_betscreen
                    //   // if (FinalResultAmount == null) {
                    //   //   FinalResultAmount = 0;
                    //   //   var valMinAmount = balance! - FinalResultAmount!;
                    //   //   totalBalance = valMinAmount;
                    //   // } else {
                    //   //   var balanceMinAmount = totalBalance! - FinalResultAmount!;
                    //   //   totalBalance = balanceMinAmount;
                    //   // }
                    //   //testingin ko paguwi ni dadi or pagdating nung pos
                    //   FinalResultAmount = int.parse(amountController!.text);
                    //   print('FinalResultAmount: ${FinalResultAmount}');
                    //   print('amountController: ${amountController!.text}');
                    //   print('totalBalance: ${totalBalance}');
                    //   if (FinalResultAmount! <= totalBalance!) {
                    //     showDialog(
                    //       context: context,
                    //       builder: (context) {
                    //         return
                    //             // MaterialButton(
                    //             //     minWidth: 500,
                    //             //     elevation: 100,
                    //             //     onPressed: () async {
                    //             //       await initPayment(
                    //             //           amountPayment:
                    //             //               FinalResultAmount!.toDouble(),
                    //             //           context: context,
                    //             //           fullName: 'Gilmer Andro Pangilinan');
                    //             //       print('qweasdzxc');
                    //             //     });
                    //             AlertDialog(
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(20.0)),
                    //           ),
                    //           title: Text('Cash In'),
                    //           content: Text('Are you sure? \n\n' +
                    //               'Amount          :     ${FinalResultAmount}.00\n' +
                    //               'Bal. Before    :     ${totalBalance}.00\n' +
                    //               'Bal. After       :     ${totalBalance! - FinalResultAmount!}.00\n' +
                    //               'Fee                 :     0.00\n' +
                    //               'Date               :     2022 08-04-02 03:48\n\n'),
                    //           actions: [
                    //             TextButton(
                    //               child: Text('Yes'),
                    //               onPressed: () {
                    //                 paymentController.makePayment(
                    //                     amount: '${FinalResultAmount}',
                    //                     currency: 'PHP');
                    //                 // Get.to(CashinHomeScreen(
                    //                 //   FinalResultAmount: FinalResultAmount,
                    //                 //   totalBalance: totalBalance,
                    //                 // ));
                    //               },
                    //             ),
                    //             TextButton(
                    //               child: Text('No'),
                    //               onPressed: () {
                    //                 Get.back();
                    //                 amountController!.clear();
                    //                 FinalResultAmount = 0;
                    //               },
                    //             ),
                    //           ],
                    //         );
                    //       },
                    //     );
                    //   } else if (FinalResultAmount! > totalBalance!) {
                    //     showDialog(
                    //       context: context,
                    //       builder: (context) {
                    //         return AlertDialog(
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(20.0)),
                    //           ),
                    //           icon: Icon(Icons.notifications),
                    //           title: Text('Insufficient Balance'),
                    //           content: Text(
                    //             'You do not have enough balance to perform this transaction. Please check and try again or contact support on ibayadsupport@ibayad.com',
                    //             textAlign: TextAlign.justify,
                    //           ),
                    //           actions: [
                    //             TextButton(
                    //               child: Text('Ok'),
                    //               onPressed: () {
                    //                 Get.back();
                    //                 amountController!.clear();
                    //                 FinalResultAmount = 0;
                    //               },
                    //             ),
                    //           ],
                    //         );
                    //       },
                    //     );
                    //   }
                    // } else {
                    //   showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return AlertDialog(
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(20.0)),
                    //         ),
                    //         title: Text('Invalid Cash In'),
                    //         content: Text(
                    //             'Please enter the amount you want to cash in.'),
                    //         actions: [
                    //           TextButton(
                    //             child: Text('Ok'),
                    //             onPressed: () {
                    //               Get.back();
                    //               amountController!.clear();
                    //               FinalResultAmount = 0;
                    //             },
                    //           ),
                    //         ],
                    //       );
                    //     },
                    //   );
                    // }
                  },
                  child: Text(
                    'CASH IN',
                    style: cashinButtonTextStyle,
                  ),
                  color: Color.fromRGBO(226, 32, 44, 1),
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    //CLEAR BUTTON
                    ClearButton(
                      amountController: amountController,
                      FinalResultAmount: FinalResultAmount,
                    ),

                    SizedBox(width: 10),
                    //CANCEL BUTTON
                    CancelCashinButton(
                      passwordc1: passwordc1,
                      passwordc2: passwordc2,
                      passwordc3: passwordc3,
                      fullName: fullName,
                      FinalResultAmount: FinalResultAmount,
                      totalBalance: totalBalance,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    //);
  }

  // void route() {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   var kk = FirebaseFirestore.instance
  //       .collection('vitas')
  //       .doc(user!.uid)
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     if (documentSnapshot.exists) {
  //       if (documentSnapshot.get('cashierstatus') == "Cash In") {
  //         var fullName = documentSnapshot.get('fullname');
  //         // Navigator.pushReplacement(
  //         //   context,
  //         //   MaterialPageRoute(
  //         //     builder: (context) => CashinHomeScreen(),
  //         //   ),
  //         // );
  //         Get.to(CashinHomeScreen(fullName: fullName));
  //       } else if (documentSnapshot.get('cashierstatus') == "Cash Out") {
  //         var fullName = documentSnapshot.get('fullname');
  //         // Navigator.pushReplacement(
  //         //   context,
  //         //   MaterialPageRoute(
  //         //     builder: (context) => CashoutHomeScreen(),
  //         //   ),
  //         // );
  //         Get.to(CashoutHomeScreen(fullName: fullName));
  //       } else if (documentSnapshot.get('cashierstatus') == "Bet") {
  //         var fullName = documentSnapshot.get('fullname');
  //         // Navigator.pushReplacement(
  //         //   context,
  //         //   MaterialPageRoute(
  //         //     builder: (context) => FightHomeScreen(),
  //         //   ),
  //         // );
  //         Get.to(FightHomeScreen(fullName: fullName));
  //       }
  //     } else {
  //       print('Document does not exist on the database');
  //     }
  //   });
  // }

  // Future<void> logout(BuildContext context) async {
  //   CircularProgressIndicator();
  //   await FirebaseAuth.instance.signOut();
  //   Get.to(SignIn());
  // }

  // Future readCard() async {
  //   final int newReadCard = await cardReader.invokeMethod('readCard');

  // }
}

class Paycard {
  final String cardnumber;
  final String balance;
  Paycard(this.cardnumber, this.balance);
}
