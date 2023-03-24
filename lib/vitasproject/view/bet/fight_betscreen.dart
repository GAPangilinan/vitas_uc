import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:vitas_uc/vitasproject/view/widgets/bet_button.dart';
import '../constants.dart';
import '../widgets/cancel_bet_button.dart';
import '../widgets/cashin_button.dart';
import '../widgets/clear_button.dart';
import '../widgets/components/amount_row1.dart';
import '../widgets/components/amount_row2.dart';
import '../widgets/components/input_amount.dart';
import 'fight_homescreen.dart';

class FightBetScreen extends StatelessWidget {
  String? passwordc1;
  String? passwordc2;
  String? passwordc3;
  String? fullName;
  String? resultcode;
  int? balance;
  int? FinalResultAmount;
  int? totalBalance;
  FightBetScreen({
    this.resultcode,
    this.fullName,
    this.passwordc1,
    this.passwordc2,
    this.passwordc3,
    this.FinalResultAmount,
    this.totalBalance,
  });

  getPaycardData() async {
    // print(result);
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

  // final AuthService _auth = AuthService();
  final formKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();
  int maxBet = 10000;
  int numOne = 0;
  int amount = 0;

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
                  // child: Card(
                  child: FutureBuilder(
                    future: getPaycardData(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Container(
                          child: Center(
                            child: Text('Loading......'),
                          ),
                        );
                      } else {
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
                                var balMinFin =
                                    totalBalance! - FinalResultAmount!;
                                totalBalance = balMinFin;
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
                                title: Text(snapshot.data[i].cardnumber,
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
                  // ),
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
                        'FIGHT NO: 1',
                        style: TextStyle(
                          fontSize: 19,
                          color: Color.fromRGBO(102, 102, 102, 1),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      SizedBox(width: 160),
                      Text(
                        'OPEN',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'MERON',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      'VS',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(102, 102, 102, 1),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      'WALA',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Talisayin',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      'BREED',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(102, 102, 102, 1),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      'Roundhed',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pedro Martinez',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(width: 1),
                    Text(
                      'OWNER',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(102, 102, 102, 1),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      'Ronald Marasigan',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '100,000,000.00',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      'BET',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(102, 102, 102, 1),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      '100,000,000.00',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
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
                // BetButton(
                //     amountController: amountController,
                //     FinalResultAmount: FinalResultAmount,
                //     totalBalance: totalBalance),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  minWidth: 500,
                  elevation: 100,
                  // height: 53,
                  height: MediaQuery.of(context).size.height / 15,
                  onPressed: () async {
                    if (amountController!.text.isNotEmpty) {
                      FinalResultAmount = int.parse(amountController!.text);
                      if (FinalResultAmount! <= totalBalance!) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              title: Text('Cash In'),
                              content: Text('Are you sure? \n\n' +
                                  'Amount          :     ${FinalResultAmount}.00\n' +
                                  'Bal. Before    :     ${totalBalance}.00\n' +
                                  'Bal. After       :     ${totalBalance! - FinalResultAmount!}.00\n' +
                                  'Fee                 :     0.00\n' +
                                  'Date               :     2022 08-04-02 03:48\n\n'),
                              actions: [
                                TextButton(
                                  child: Text('Yes'),
                                  onPressed: () {
                                    Get.to(FightHomeScreen(
                                      FinalResultAmount: FinalResultAmount,
                                      totalBalance: totalBalance,
                                    ));
                                  },
                                ),
                                TextButton(
                                  child: Text('No'),
                                  onPressed: () {
                                    Get.back();
                                    amountController!.clear();
                                    FinalResultAmount = 0;
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else if (FinalResultAmount! > totalBalance!) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              icon: Icon(Icons.notifications),
                              title: Text('Insufficient Balance'),
                              content: Text(
                                'You do not have enough balance to perform this transaction. Please check and try again or contact support on ibayadsupport@ibayad.com',
                                textAlign: TextAlign.justify,
                              ),
                              actions: [
                                TextButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Get.back();
                                    amountController!.clear();
                                    FinalResultAmount = 0;
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            title: Text('Invalid Cash In'),
                            content: Text(
                                'Please enter the amount you want to cash in.'),
                            actions: [
                              TextButton(
                                child: Text('Ok'),
                                onPressed: () {
                                  Get.back();
                                  amountController!.clear();
                                  FinalResultAmount = 0;
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
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
                    CancelBetButton(
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

  // Future<void> logout(BuildContext context) async {
  //   CircularProgressIndicator();
  //   await FirebaseAuth.instance.signOut();
  //   // Navigator.pushReplacement(
  //   //   context,
  //   //   MaterialPageRoute(
  //   //     builder: (context) => SignIn(),
  //   //   ),
  //   // );
  //   Get.to(SignIn());
  // }
}

class Paycard {
  final String cardnumber;
  final String balance;
  Paycard(this.cardnumber, this.balance);
}
