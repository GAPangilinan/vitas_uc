// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:vitas_pos_app/view/bet/bet_screen.dart';
// import 'package:vitas_pos_app/view/widgets/cashierwidget.dart';
// import 'package:vitas_pos_app/view/widgets/current_round.dart';
// import 'package:vitas_pos_app/view/widgets/fight_number_widget.dart';

// class HomeBetScreen extends StatelessWidget {
//   const HomeBetScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Image.asset(
//           "assets/images/background.jpg",
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           fit: BoxFit.cover,
//         ),
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           body: SingleChildScrollView(
//             child: SafeArea(
//                 child: Container(
//               padding: const EdgeInsets.all(15.0),
//               width: double.infinity,
//               child: Column(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         child: Image.asset(
//                           "assets/images/logo.png",
//                           height: 100,
//                           width: 100,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 40,
//                       ),
//                       const CashierWidget(),
//                       const Divider(
//                         thickness: 2,
//                         color: Colors.blue,
//                       ),
//                       const FightNumber(),
//                       const Divider(
//                         thickness: 2,
//                         color: Colors.blue,
//                       ),
//                       const CurrentRound(),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             Get.to(() => const BetScreen());
//                           },
//                           child: Image.asset(
//                             "assets/images/qr icon.png",
//                             height: 200,
//                             width: 150,
//                           ),
//                         ),
//                         Image.asset(
//                           "assets/images/nfc icon.png",
//                           height: 200,
//                           width: 150,
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             )),
//           ),
//         )
//       ],
//     );
//   }
// }