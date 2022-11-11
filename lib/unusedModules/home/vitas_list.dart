import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitas_uc/models/vitasmodel.dart';
import 'package:vitas_uc/unusedModules/home/vitas_tile.dart';

class VitasList extends StatefulWidget {
  const VitasList({super.key});

  //const VitasList({super.key});

  @override
  State<VitasList> createState() => _VitasListState();
}

class _VitasListState extends State<VitasList> {
  @override
  Widget build(BuildContext context) {
    final pvitas = Provider.of<List<VitasModel>?>(context);
    if (pvitas != null) {
      pvitas.forEach((vitas) {
        print(vitas.username!);
        print(vitas.cashierstatus!);
        print(vitas.mwstatus!);
      });
    }

    return ListView.builder(
      itemCount: pvitas?.length,
      itemBuilder: (context, index) {
        return VitasTile(vitas: pvitas?[index]);
      },
    );
  }
}
