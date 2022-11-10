import 'package:flutter/material.dart';
import 'package:vitas_uc/screens/authenticate/forgot_password.dart';
import 'package:vitas_uc/screens/bet_screen.dart';
import 'package:vitas_uc/screens/home/cashout/cashout_homescreen.dart';
import 'package:vitas_uc/screens/home_screen.dart';
import 'package:vitas_uc/screens/loading_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vitas_uc/screens/loading_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  //initilization of Firebase app

  // other Firebase service initialization

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return StreamProvider<UserModel?>.value(
    //   initialData: null,
    //   value: AuthService().user,
    //   child: MaterialApp(
    //     home: Wrapper(),
    //   ),
    // );
    return MaterialApp(
      //home: ForgotPasswordPage(),
      home: CashoutHomeScreen(),
      //home: HomeScreen(),
      //home: BetScreen(),
      //home: LoadingScreen(),
      //home: Home(),
      //home: QRCreateScreen(),
      // home: QRScannerScreen(),
      //home: CameraQR(),
    );
  }
}
