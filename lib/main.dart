import 'package:flutter/material.dart';
import 'package:vitas_uc/screens/authenticate/forgot_password.dart';
import 'package:vitas_uc/screens/betscreen/cashin_betscreen/cashin_betscreen.dart';
import 'package:vitas_uc/screens/betscreen/cashout_betscreen/cashout_betscreen.dart';
import 'package:vitas_uc/screens/fight_betscreen/fight_betscreen.dart';
import 'package:vitas_uc/screens/fight_homescreen/fight_homescreen.dart';
import 'package:vitas_uc/screens/home/cashout/cashout_homescreen.dart';
import 'package:vitas_uc/screens/home/cashin/cashin_homescreen.dart';
import 'package:vitas_uc/screens/loading_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vitas_uc/screens/loading_screen.dart';
import 'package:vitas_uc/unusedModules/authenticate/register.dart';
import 'package:vitas_uc/vitasproject/screens/loading_screen.dart';
import 'package:vitas_uc/vitasproject/screens/register.dart';

Future<void> main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  //initilization of Firebase app

  // other Firebase service initialization

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home: LoadingScreen(),
      //home: Register(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     // return StreamProvider<UserModel?>.value(
//     //   initialData: null,
//     //   value: AuthService().user,
//     //   child: MaterialApp(
//     //     home: Wrapper(),
//     //   ),
//     // );
//     return MaterialApp(
//         //home: FightBetScreen(),
//         //home: FightHomeScreen(),
//         //home: ForgotPasswordPage(),
//         //home: CashoutHomeScreen(),
//         //home: CashoutBetScreen(),
//         //home: CashinHomeScreen(),
//         //home: CashinBetScreen(),
//         //home: LoadingScreen(),
//         //home: Home(),
//         //home: QRCreateScreen(),
//         // home: QRScannerScreen(),
//         //home: CameraQR(),
//         );
//   }
// }
