import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitas_uc/models/vitasmodel.dart';
import 'package:vitas_uc/screens/home/cashin/cashin_homescreen.dart';
import 'package:vitas_uc/screens/qrscanner_screen.dart';
import 'package:vitas_uc/services/auth.dart';
import 'package:vitas_uc/services/database.dart';

class FightBetScreen extends StatelessWidget {
  // const FightBetScreen({super.key});

  final AuthService _auth = AuthService();
  TextEditingController amountController = TextEditingController();
  int BalBefore = 1000;
  int numOne = 0;
  int amount = 0;
  int FinalResultAmount = 0;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<VitasModel>?>.value(
      initialData: null,
      value: DatabaseService(uid: '').vitas,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(62, 58, 57, 1),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 1,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
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
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: 0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '####-####-####-4231',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(102, 102, 102, 1),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        SizedBox(width: 105),
                        IconButton(
                          icon: Icon(Icons.login_rounded),
                          iconSize: 30,
                          color: Colors.grey[700],
                          onPressed: () async {
                            await _auth.signOut();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0),
                  Row(
                    children: <Widget>[
                      Text(
                        'Card Number',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(102, 102, 102, 1),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      SizedBox(width: 135),
                      Row(
                        children: [
                          Text(
                            BalBefore.toString() + '.00',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(102, 102, 102, 1),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.blueAccent,
                            width: 2.0,
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
                        SizedBox(width: 150),
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
                            width: 2.0,
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
                  Container(
                    height: 40,
                    child: TextFormField(
                      controller: amountController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Amount',
                        enabled: true,
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 12.0, top: 12.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: 80,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          minWidth: 100,
                          elevation: 100,
                          height: 53,
                          onPressed: () async {
                            amount = 100;
                            amountController.text = amount.toString();
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
                        height: 40,
                        width: 80,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          minWidth: 100,
                          elevation: 100,
                          height: 53,
                          onPressed: () async {
                            amount = 300;
                            amountController.text = amount.toString();
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
                        height: 40,
                        width: 80,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          minWidth: 100,
                          elevation: 100,
                          height: 53,
                          onPressed: () async {
                            amount = 500;
                            amountController.text = amount.toString();
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
                        height: 40,
                        width: 80,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          minWidth: 100,
                          elevation: 100,
                          height: 53,
                          onPressed: () async {
                            amount = 1000;
                            amountController.text = amount.toString();
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
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: 80,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          minWidth: 100,
                          elevation: 100,
                          height: 53,
                          onPressed: () async {
                            amount = 2000;
                            amountController.text = amount.toString();
                          },
                          child: Text(
                            '2000',
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
                        height: 40,
                        width: 80,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          minWidth: 100,
                          elevation: 100,
                          height: 53,
                          onPressed: () async {
                            amount = 3000;
                            amountController.text = amount.toString();
                          },
                          child: Text(
                            '3000',
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
                        height: 40,
                        width: 80,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          minWidth: 100,
                          elevation: 100,
                          height: 53,
                          onPressed: () async {
                            amount = 5000;
                            numOne = FinalResultAmount;
                            amountController.text = amount.toString();
                          },
                          child: Text(
                            '5000',
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
                        height: 40,
                        width: 80,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          minWidth: 100,
                          elevation: 100,
                          height: 53,
                          onPressed: () async {
                            amount = 10000;
                            amountController.text = amount.toString();
                          },
                          child: Text(
                            'Max',
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
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      minWidth: 500,
                      elevation: 100,
                      height: 53,
                      onPressed: () async {
                        // String resultAmount = amountController.text
                        //     .replaceAll(RegExp('[^A-Za-z0-9]'), '');
                        // int finaleResultAmount = int.parse(resultAmount
                        //     .toString()
                        //     .replaceAll(RegExp('[^0-9]'), ''));
                        if (amountController.text.isNotEmpty) {
                          if (FinalResultAmount <= BalBefore) {
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
                                      'Bal. Before    :     ${BalBefore.toString()}.00\n' +
                                      'Bal. After       :     ${BalBefore - FinalResultAmount}.00\n' +
                                      'Fee                 :     0.00\n' +
                                      'Date               :     2022 08-04-02 03:48\n\n'),
                                  actions: [
                                    TextButton(
                                      child: Text('Yes'),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()));
                                      },
                                    ),
                                    TextButton(
                                      child: Text('No'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        amountController.clear();
                                        FinalResultAmount = 0;
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else if (FinalResultAmount > BalBefore) {
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
                                        Navigator.pop(context);
                                        amountController.clear();
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
                                      Navigator.pop(context);
                                      amountController.clear();
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
                        style: TextStyle(
                          letterSpacing: 2.0,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      color: Color.fromRGBO(226, 32, 44, 1),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Container(
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          minWidth: 170,
                          elevation: 100,
                          height: 53,
                          onPressed: () async {
                            amountController.clear();
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
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          minWidth: 170,
                          elevation: 100,
                          height: 53,
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          },
                          child: Text(
                            'CANCEL',
                            style: TextStyle(
                              letterSpacing: 2.0,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          color: Color.fromRGBO(67, 67, 67, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
