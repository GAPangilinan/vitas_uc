import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:vitas_uc/vitasproject/view/bet/fight_homescreen.dart';
import 'package:vitas_uc/vitasproject/view/cashout/cashout_homescreen.dart';
// import 'package:vitas_uc/vitasproject/view/models/vitasmodel.dart';
//import 'package:vitas_uc/vitasproject/services/auth.dart';
// import 'package:vitas_uc/vitasproject/services/database.dart';
import 'package:vitas_uc/vitasproject/view/cashin/cashin_homescreen.dart';
import 'package:vitas_uc/vitasproject/view/widgets/components/amount_row1.dart';
import 'package:vitas_uc/vitasproject/view/widgets/components/amount_row2.dart';
import 'package:vitas_uc/vitasproject/view/screens/sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:vitas_uc/vitasproject/view/widgets/cancel_button.dart';
import 'package:vitas_uc/vitasproject/view/widgets/cashin_button.dart';
import 'package:flutterme_credit_card/flutterme_credit_card.dart';
import 'package:vitas_uc/vitasproject/view/widgets/clear_button.dart';
import 'package:vitas_uc/vitasproject/view/widgets/components/input_amount.dart';

class CashinBetScreen extends StatelessWidget {
  // const BetScreen({super.key});
  String? passwordc1;
  String? passwordc2;
  String? passwordc3;
  String? fullName;
  String? resultcode;
  String? cardnumber;
  String? amountC;
  int? balance;
  int? totalBalance;
  CashinBetScreen(
      {this.resultcode,
      this.fullName,
      this.passwordc1,
      this.passwordc2,
      this.passwordc3,
      this.totalBalance,
      this.FinalResultAmount,
      this.amountC});

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

        paycards.add(paycard);
      }

      print(paycards.length);
      return paycards;
    } else if (resultcode == '6819-5619-7287-4123') {
      var jsonData = jsonDecode(response3.body);
      List<Paycard> paycards = [];

      for (var p in jsonData) {
        Paycard paycard = Paycard(p["cardnumber"], p["balance"].toString());
        paycards.add(paycard);
      }

      print(paycards.length);
      return paycards;
    }
  }

  //final AuthService _auth = AuthService();
  final formKey = GlobalKey<FormState>();
  TextEditingController? amountController = TextEditingController();
  int maxBet = 10000;
  int numOne = 0;
  int amount = 0;
  int value = 100;
  int? FinalResultAmount;
  int? recentBalance;
  int? amountCont;

  @override
  Widget build(BuildContext context) {
    // return StreamProvider<List<VitasModel>?>.value(
    //   initialData: null,
    //   value: DatabaseService(uid: '').vitas,
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(62, 58, 57, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            // height: MediaQuery.of(context).size.height / 1.1,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 0),
                Container(
                  // height: 120,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                    ),
                  ),
                ),
                SizedBox(height: 0),
                Container(
                  child: FutureBuilder(
                    future: getPaycardData(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        print(amountC);
                        // amountController?.text = amountC!;
                        return Container(
                          child: Center(
                            child: Text('Loading......'),
                          ),
                        );
                      } else {
                        if (FinalResultAmount == null) {
                          FinalResultAmount = 0;
                          var valMinAmount = balance! - FinalResultAmount!;
                          totalBalance = valMinAmount;
                        } else {
                          print(totalBalance);
                          var balMinFin = totalBalance! - FinalResultAmount!;
                          totalBalance = balMinFin;
                        }

                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, i) {
                              var asd = snapshot.data[i].cardnumber;
                              asd.replaceRange(
                                  12, asd.length, "#" * (asd.length - 4));
                              return ListTile(
                                title: Text(asd, //Mask in Card Number
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
                      }
                    },
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
                          // width: 2.0,
                          width: MediaQuery.of(context).size.width / 200,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        'CASH IN',
                        style: TextStyle(
                          fontSize: 19,
                          color: Color.fromRGBO(54, 191, 54, 1),
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
                          // width: 2.0,
                          width: MediaQuery.of(context).size.width / 200,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Important:',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(102, 102, 102, 1),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'By using this cash in facility, you agree that the amount will be credited to your card with a minimum fee of (0.00).',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 10,
                    color: Color.fromRGBO(102, 102, 102, 1),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Upon confirmation of the transaction, the amount credited to the card is non refundable and can not be reversed.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 10,
                    color: Color.fromRGBO(102, 102, 102, 1),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                    fontFamily: 'Roboto',
                  ),
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
                CashinButton(
                    amountController: amountController,
                    FinalResultAmount: FinalResultAmount,
                    totalBalance: totalBalance),
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
                    CancelButton(
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
}

class Paycard {
  final String cardnumber;
  final String balance;
  Paycard(this.cardnumber, this.balance);
}
