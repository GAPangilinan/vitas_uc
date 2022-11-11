import 'package:flutter/material.dart';
import 'package:vitas_uc/models/vitasmodel.dart';
import 'package:vitas_uc/unusedModules/home/vitas_list.dart';

class VitasTile extends StatelessWidget {
  //const VitasTile({super.key});

  final VitasModel? vitas;
  VitasTile({this.vitas});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown,
          ),
          title: Text('${vitas?.username}'),
          subtitle: Text('Cashier Status: ${vitas?.cashierstatus}'),
          trailing: Text('MW Status: ${vitas?.mwstatus}'),
        ),
      ),
    );
  }
}
