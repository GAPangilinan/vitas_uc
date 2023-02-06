// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:vitas_uc/vitasproject/view/cashin/cashin_homescreen.dart';

// class CashInButton extends StatelessWidget {
//   //const CashInButton({super.key});
//   TextEditingController? amountController = TextEditingController();
//   int? FinalResultAmount;
//   int? balance;

//   final List<Map<String, dynamic>> data = [
//     {'title': 'Amount:', 'amount': '300.00\n'},
//     {'title': 'Bal. Before:', 'balance': '1000.00\n'},
//     {'title': 'Bal. After:', 'balance': '700.00\n'},
//     {'title': 'Fee:', 'fee': '0.00\n'},
//     {'title': 'Date:', 'date': '2022 08-04-02 03:48\n\n'},
//   ];

//   // 'Amount          :     ${FinalResultAmount}.00\n' +
//   // 'Bal. Before    :     ${balance.toString()}.00\n' +
//   // 'Bal. After       :     ${balance! - FinalResultAmount!}.00\n' +
//   // 'Fee                 :     0.00\n' +
//   // 'Date               :     2022 08-04-02 03:48\n\n'),

//   //int BalBefore = 1000;
//   //int numOne = 0;
//   //int amount = 0;

//   CashInButton({this.amountController, this.FinalResultAmount, this.balance});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(10.0))),
//       minWidth: 500,
//       elevation: 100,
//       height: 53,
//       onPressed: () async {
//         // String resultAmount = amountController.text
//         //     .replaceAll(RegExp('[^A-Za-z0-9]'), '');
//         // int finaleResultAmount = int.parse(resultAmount
//         //     .toString()
//         //     .replaceAll(RegExp('[^0-9]'), ''));

//         if (amountController!.text != '') {
//           FinalResultAmount = int.parse(amountController!.text);
//           if (FinalResultAmount! <= balance!) {
//             showDialog(
//               context: context,
//               builder: (context) {
//                 return AlertDialog(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                   ),
//                   title: Text('Cash In'),
//                   content: Text('Are you sure? \n\n' +
//                       'Amount          :     ${FinalResultAmount}.00\n' +
//                       'Bal. Before    :     ${balance.toString()}.00\n' +
//                       'Bal. After       :     ${balance! - FinalResultAmount!}.00\n' +
//                       'Fee                 :     0.00\n' +
//                       'Date               :     2022 08-04-02 03:48\n\n'),
//                   actions: [
//                     TextButton(
//                       child: Text('Yes'),
//                       onPressed: () {
//                         // Navigator.push(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //         builder: (context) =>
//                         //             CashinHomeScreenOld()));
//                         Get.to(CashinHomeScreen());
//                         // Get.to(PrintPage(data));
//                       },
//                     ),
//                     TextButton(
//                       child: Text('No'),
//                       onPressed: () {
//                         // Navigator.pop(context);
//                         // amountController.clear();
//                         // FinalResultAmount = 0;

//                         Get.back();
//                         amountController!.clear();
//                         FinalResultAmount = 0;
//                       },
//                     ),
//                   ],
//                 );
//               },
//             );
//           } else if (FinalResultAmount! > balance!) {
//             showDialog(
//               context: context,
//               builder: (context) {
//                 return AlertDialog(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                   ),
//                   icon: Icon(Icons.notifications),
//                   title: Text('Insufficient Balance'),
//                   content: Text(
//                     'You do not have enough balance to perform this transaction. Please check and try again or contact support on ibayadsupport@ibayad.com',
//                     textAlign: TextAlign.justify,
//                   ),
//                   actions: [
//                     TextButton(
//                       child: Text('Ok'),
//                       onPressed: () {
//                         // Navigator.pop(context);
//                         // amountController.clear();
//                         // FinalResultAmount = 0;

//                         Get.back();
//                         amountController!.clear();
//                         FinalResultAmount = 0;
//                       },
//                     ),
//                   ],
//                 );
//               },
//             );
//           }
//         } else {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                 ),
//                 title: Text('Invalid Cash In'),
//                 content: Text('Please enter the amount you want to cash in.'),
//                 actions: [
//                   TextButton(
//                     child: Text('Ok'),
//                     onPressed: () {
//                       // Navigator.pop(context);
//                       // amountController.clear();
//                       // FinalResultAmount = 0;
//                       Get.back();
//                       amountController!.clear();
//                       FinalResultAmount = 0;
//                     },
//                   ),
//                 ],
//               );
//             },
//           );
//         }
//       },
//       child: Text(
//         'CASH IN',
//         style: TextStyle(
//           letterSpacing: 2.0,
//           fontSize: 15,
//           color: Colors.white,
//         ),
//       ),
//       color: Color.fromRGBO(226, 32, 44, 1),
//     );
//   }
// }
