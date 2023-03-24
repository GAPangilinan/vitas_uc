import 'package:flutter/material.dart';

//BACKGROUND IMAGE
const bgImage = BoxDecoration(
  image: DecorationImage(
      image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
);

//LOADING SCREEN SPLASH IMAGE
const bgSplash = BoxDecoration(
  image: DecorationImage(image: AssetImage('assets/splash.png')),
);

//APP LOGO
const bgLogo = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/logo.png'),
  ),
);

//'CASHIER LOGIN' TEXTSTYLE
const CLStyle = TextStyle(
  fontSize: 28,
  color: Color.fromRGBO(102, 102, 102, 1),
  fontWeight: FontWeight.bold,
  letterSpacing: 3.0,
  fontFamily: 'Roboto',
);

//SIGN-IN EMAIL INPUT DECORATION
var emailInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Email',
  enabled: true,
  contentPadding: const EdgeInsets.only(left: 14.0, bottom: 16.0, top: 16.0),
  focusedBorder: OutlineInputBorder(
    borderSide: /*new*/
        const BorderSide(color: Colors.white),
    borderRadius: new BorderRadius.circular(10),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: /*new*/
        const BorderSide(color: Colors.white),
    borderRadius: new BorderRadius.circular(10),
  ),
);

//FORGOT PASSWORD TEXTSTYLE
const fpassTextStyle = TextStyle(
  color: Color.fromRGBO(102, 102, 102, 1),
  decoration: TextDecoration.underline,
  decorationThickness: 1.8,
);

//BLUE-BORDER LINE DECORATION
var bbDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(
      color: Colors.blueAccent,
      width: 2.0,
    ),
  ),
);

//FORGOT PASSWORD MODULE TEXTSTYLE
const fpmTextStyle = TextStyle(
  fontSize: 28,
  color: Color.fromRGBO(102, 102, 102, 1),
  fontWeight: FontWeight.bold,
  letterSpacing: 3.0,
  fontFamily: 'Roboto',
);

//CASHIER NAME HEADER TEXTSTYLE
const cnHeaderTextStyle = TextStyle(
  fontSize: 15,
  color: Color.fromRGBO(102, 102, 102, 1),
  fontWeight: FontWeight.bold,
  letterSpacing: 2.0,
  fontFamily: 'Roboto',
);

//CASHIER TEXT & AMOUNT HEADER TEXTSTYLE
const ctaHeaderTextStyle = TextStyle(
  fontSize: 15,
  color: Color.fromRGBO(102, 102, 102, 1),
  fontWeight: FontWeight.bold,
  letterSpacing: 3.0,
  fontFamily: 'Roboto',
);

//GREEN CASH IN, CASH OUT, FIGHT TEXT
const GreenTextStyle = TextStyle(
  fontSize: 19,
  color: Color.fromRGBO(54, 191, 54, 1),
  fontWeight: FontWeight.bold,
  letterSpacing: 3.0,
  fontFamily: 'Roboto',
);

//CASH-IN INFORMATION
const infoTextStyle = TextStyle(
  fontSize: 10,
  color: Color.fromRGBO(102, 102, 102, 1),
  fontWeight: FontWeight.bold,
  letterSpacing: 3.0,
  fontFamily: 'Roboto',
);

//QR ICON DECORATION
const qrIcon = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/qr icon.png'),
  ),
);

//FIGHT NO. 1 TEXTSTYLE
const fTextStyle = TextStyle(
  fontSize: 19,
  color: Color.fromRGBO(102, 102, 102, 1),
  fontWeight: FontWeight.bold,
  letterSpacing: 3.0,
  fontFamily: 'Roboto',
);

//LEFT MERON INFO TEXTSTYLE
const mLeftInfoTextStyle = TextStyle(
  fontSize: 10,
  color: Colors.red,
  fontWeight: FontWeight.bold,
  letterSpacing: 3.0,
  fontFamily: 'Roboto',
);

//BET MIDDLE INFO TEXTSYLE
const middleBetInfoStextStyle = TextStyle(
  fontSize: 10,
  color: Color.fromRGBO(102, 102, 102, 1),
  fontWeight: FontWeight.bold,
  letterSpacing: 3.0,
  fontFamily: 'Roboto',
);

//RIGHT WALA INFO TEXTSTYLE
const wRightInfoTextStyle = TextStyle(
  fontSize: 10,
  color: Colors.blue,
  fontWeight: FontWeight.bold,
  letterSpacing: 3.0,
  fontFamily: 'Roboto',
);

//BET WHITE INFO TEXTSTYLE
const wBetInfoTextStyle = TextStyle(
  fontSize: 10,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  letterSpacing: 3.0,
  fontFamily: 'Roboto',
);

//BET AMOUNT 'MIN' BUTTON
const amountButtonTextStyle = TextStyle(
  letterSpacing: 2.0,
  fontSize: 15,
  color: Colors.white,
);

//BET INPUT AMOUNT TEXTFORMFIELD DECORATION
var amountInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Amount',
  enabled: true,
  contentPadding: const EdgeInsets.only(left: 14.0, bottom: 12.0, top: 12.0),
  focusedBorder: OutlineInputBorder(
    borderSide: new BorderSide(color: Colors.white),
    borderRadius: new BorderRadius.circular(10),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: new BorderSide(color: Colors.white),
    borderRadius: new BorderRadius.circular(10),
  ),
);

//BET CANCEL BUTTON TEXTSTYLE
const cancelButtonTextStyle = TextStyle(
  letterSpacing: 2.0,
  fontSize: 15,
  color: Colors.white,
);

//BET CASHIN BUTTON TEXTSTYLE
const cashinButtonTextStyle = TextStyle(
  letterSpacing: 2.0,
  fontSize: 15,
  color: Colors.white,
);

//BET CLEAR BUTTON TEXTSTYLE
const clearButtonTextStyle = TextStyle(
  letterSpacing: 2.0,
  fontSize: 15,
  color: Colors.white,
);

//LOGIN BUTTON TEXTSTYLE
const loginButtonTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
);

//FORGOT PASSWORD SUBMIT BUTTON TEXTSTYLE
const submitButtonTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
);
