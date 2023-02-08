import 'package:flutter/material.dart';

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
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Amount',
          enabled: true,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 12.0, top: 12.0),
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
    );
  }
}
