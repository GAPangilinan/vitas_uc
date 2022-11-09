import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:provider/provider.dart';
import 'package:vitas_uc/models/user_model.dart';
import 'package:vitas_uc/screens/wrapper.dart';
import 'package:vitas_uc/services/auth.dart';
import 'package:vitas_uc/services/database.dart';

class AuthLoadingService extends StatelessWidget {
  const AuthLoadingService({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
