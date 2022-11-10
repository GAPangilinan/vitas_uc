import 'package:flutter/material.dart';
import 'package:vitas_uc/models/user_model.dart';
import 'package:vitas_uc/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:vitas_uc/screens/betscreen/cashin_betscreen/cashin_betscreen.dart';
import 'package:vitas_uc/unusedModules/home/home.dart';
import 'package:vitas_uc/screens/home/cashin/cashin_homescreen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    //Return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return HomeScreen();
    }
  }
}
