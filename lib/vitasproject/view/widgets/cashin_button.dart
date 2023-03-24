import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vitas_uc/vitasproject/view/cashin/cashin_betscreen.dart';
import 'package:http/http.dart' as http;

import '../cashin/cashin_homescreen.dart';
import '../constants.dart';

class CashinButton extends StatelessWidget {
  TextEditingController? amountController = TextEditingController();
  String? resultcode;
  int? FinalResultAmount;
  int? totalBalance;
  CashinButton(
      {this.amountController,
      this.FinalResultAmount,
      this.totalBalance,
      this.resultcode});
  int? balance;

  getPaycard() async {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        minWidth: 500,
        elevation: 100,
        // height: 53,
        height: MediaQuery.of(context).size.height / 15,
        onPressed: () async {
          if (amountController!.text.isNotEmpty) {
            //ilalagay ko dito yung formula ng totalBalance from cashin_betscreen
            // if (FinalResultAmount == null) {
            //   FinalResultAmount = 0;
            //   var valMinAmount = balance! - FinalResultAmount!;
            //   totalBalance = valMinAmount;
            // } else {
            //   var balanceMinAmount = totalBalance! - FinalResultAmount!;
            //   totalBalance = balanceMinAmount;
            // }
            //testingin ko paguwi ni dadi or pagdating nung pos
            FinalResultAmount = int.parse(amountController!.text);
            print('FinalResultAmount: ${FinalResultAmount}');
            print('amountController: ${amountController!.text}');
            print('totalBalance: ${totalBalance}');
            if (FinalResultAmount! <= totalBalance!) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                          Get.to(CashinHomeScreen(
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
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  title: Text('Invalid Cash In'),
                  content: Text('Please enter the amount you want to cash in.'),
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
    );
  }
}
