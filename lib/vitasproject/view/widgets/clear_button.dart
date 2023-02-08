import 'package:flutter/material.dart';

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
        minWidth: 185,
        elevation: 100,
        // height: 53,
        height: MediaQuery.of(context).size.height / 15,
        onPressed: () async {
          amountController!.clear();
          FinalResultAmount = 0;
        },
        child: Text(
          'CLEAR',
          style: TextStyle(
            letterSpacing: 2.0,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        color: Color.fromRGBO(67, 67, 67, 1),
      ),
    );
  }
}
