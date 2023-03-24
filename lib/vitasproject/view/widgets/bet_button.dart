import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vitas_uc/vitasproject/view/bet/fight_homescreen.dart';

import '../constants.dart';

class BetButton extends StatelessWidget {
  TextEditingController? amountController = TextEditingController();
  int? FinalResultAmount;
  int? totalBalance;
  BetButton({this.amountController, this.FinalResultAmount, this.totalBalance});

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
            FinalResultAmount = int.parse(amountController!.text);
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
