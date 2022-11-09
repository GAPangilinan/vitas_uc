import 'package:flutter/material.dart';
import 'package:vitas/models/user_model.dart';
import 'package:vitas/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:vitas/unusedModules/home/home.dart';
import 'package:vitas/screens/home_screen.dart';

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
