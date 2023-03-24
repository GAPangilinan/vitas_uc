import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';

class AmountRow2 extends StatelessWidget {
  int amount = 0;
  int maxBet = 10000;
  TextEditingController? amountController = TextEditingController();
  AmountRow2({this.amountController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          // height: 40,
          // width: 75,
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.210,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            minWidth: 100,
            elevation: 100,
            // height: 53,
            // height: MediaQuery.of(context).size.height / 1.1,
            onPressed: () async {
              amount = 2000;
              amountController!.text = amount.toString();
            },
            child: Text(
              '2000',
              style: amountButtonTextStyle,
            ),
            color: Color.fromRGBO(53, 183, 54, 1),
          ),
        ),
        SizedBox(width: 10),
        Container(
          // height: 40,
          // width: 75,
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.210,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            minWidth: 100,
            elevation: 100,
            // height: 53,
            // height: MediaQuery.of(context).size.height / 1.1,
            onPressed: () async {
              amount = 3000;
              amountController!.text = amount.toString();
            },
            child: Text(
              '3000',
              style: amountButtonTextStyle,
            ),
            color: Color.fromRGBO(53, 183, 54, 1),
          ),
        ),
        SizedBox(width: 10),
        Container(
          // height: 40,
          // width: 75,
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.210,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            minWidth: 100,
            elevation: 100,
            // height: 53,
            // height: MediaQuery.of(context).size.height / 1.1,
            onPressed: () async {
              amount = 5000;
              amountController!.text = amount.toString();
            },
            child: Text(
              '5000',
              style: amountButtonTextStyle,
            ),
            color: Color.fromRGBO(53, 183, 54, 1),
          ),
        ),
        SizedBox(width: 10),
        Container(
          // height: 40,
          // width: 75,
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.210,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            minWidth: 100,
            elevation: 100,
            // height: 53,
            // height: MediaQuery.of(context).size.height / 1.1,
            onPressed: () async {
              // amount = 10000;
              amountController!.text = maxBet.toString();
            },
            child: Text(
              'Max',
              style: amountButtonTextStyle,
            ),
            color: Color.fromRGBO(53, 183, 54, 1),
          ),
        ),
      ],
    );
  }
}
