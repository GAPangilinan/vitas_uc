import 'package:flutter/material.dart';

class AmountRow1 extends StatelessWidget {
  int amount = 0;
  TextEditingController? amountController = TextEditingController();
  AmountRow1({this.amountController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          // height: 40,
          // width: 75,
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.213,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            minWidth: 100,
            elevation: 100,
            height: 53,
            // height: MediaQuery.of(context).size.height / 1.1,
            onPressed: () async {
              amount = 100;
              amountController!.text = amount.toString();
            },
            child: Text(
              'Min',
              style: TextStyle(
                letterSpacing: 2.0,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            color: Color.fromRGBO(53, 183, 54, 1),
          ),
        ),
        SizedBox(width: 10),
        Container(
          // height: 40,
          // width: 75,
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.213,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            minWidth: 100,
            elevation: 100,
            height: 53,
            // height: MediaQuery.of(context).size.height / 1.1,
            onPressed: () async {
              amount = 300;
              amountController!.text = amount.toString();
            },
            child: Text(
              '300',
              style: TextStyle(
                letterSpacing: 2.0,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            color: Color.fromRGBO(53, 183, 54, 1),
          ),
        ),
        SizedBox(width: 10),
        Container(
          // height: 40,
          // width: 75,
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.213,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            minWidth: 100,
            elevation: 100,
            height: 53,
            // height: MediaQuery.of(context).size.height / 1.1,
            onPressed: () async {
              amount = 500;
              amountController!.text = amount.toString();
            },
            child: Text(
              '500',
              style: TextStyle(
                letterSpacing: 2.0,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            color: Color.fromRGBO(53, 183, 54, 1),
          ),
        ),
        SizedBox(width: 10),
        Container(
          // height: 40,
          // width: 75,
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.213,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            minWidth: 100,
            elevation: 100,
            // height: 53,
            // height: MediaQuery.of(context).size.height / 1.1,
            onPressed: () async {
              amount = 1000;
              amountController!.text = amount.toString();
            },
            child: Text(
              '1000',
              style: TextStyle(
                letterSpacing: 2.0,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            color: Color.fromRGBO(53, 183, 54, 1),
          ),
        ),
      ],
    );
  }
}
