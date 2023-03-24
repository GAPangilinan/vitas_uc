import 'package:flutter/material.dart';

import '../constants.dart';

class ClearButton extends StatelessWidget {
  TextEditingController? amountController = TextEditingController();
  int? FinalResultAmount;
  ClearButton({this.amountController, this.FinalResultAmount});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        minWidth: 176,
        elevation: 100,
        // height: 53,
        height: MediaQuery.of(context).size.height / 15,
        onPressed: () async {
          amountController!.clear();
          FinalResultAmount = 0;
        },
        child: Text(
          'CLEAR',
          style: clearButtonTextStyle,
        ),
        color: Color.fromRGBO(67, 67, 67, 1),
      ),
    );
  }
}
