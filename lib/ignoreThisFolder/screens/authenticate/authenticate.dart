import 'package:flutter/material.dart';
import 'package:vitas_uc/ignoreThisFolder/unusedModules/authenticate/register.dart';
import 'package:vitas_uc/ignoreThisFolder/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignInOld(toggleView: toggleView);
    } else {
      return RegisterOld(toggleView: toggleView);
    }
  }
}
