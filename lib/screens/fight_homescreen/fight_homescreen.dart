import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitas_uc/models/vitasmodel.dart';
import 'package:vitas_uc/screens/betscreen/cashin_betscreen/cashin_betscreen.dart';
import 'package:vitas_uc/screens/fight_betscreen/fight_betscreen.dart';
import 'package:vitas_uc/screens/qrscanner_screen.dart';
import 'package:vitas_uc/services/auth.dart';
import 'package:vitas_uc/services/database.dart';

class FightHomeScreen extends StatelessWidget {
  //const HomeScreen({super.key});

  final AuthService _auth = AuthService();

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
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
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
                  SizedBox(height: 30),
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
                      SizedBox(width: 95),
                      Text(
                        '1,000,000.00',
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
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: InkWell(
                          child: Container(
                            height: 150,
                            width: 160,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/qr icon.png'),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FightBetScreen()),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: InkWell(
                          child: Container(
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/nfc icon.png'),
                              ),
                            ),
                          ),
                          onTap: () {},
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
