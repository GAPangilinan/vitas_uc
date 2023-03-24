import 'package:flutter/material.dart';

import '../../constants.dart';

class InputAmount extends StatelessWidget {
  TextEditingController? amountController = TextEditingController();
  GlobalKey? formKey = GlobalKey<FormState>();
  InputAmount({this.amountController, this.formKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      height: MediaQuery.of(context).size.height / 15,
      child: TextFormField(
        key: formKey,
        controller: amountController,
        decoration: amountInputDecoration,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
