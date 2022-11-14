import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vitas_uc/ignoreThisFolder/models/vitasmodel.dart';
import 'package:vitas_uc/ignoreThisFolder/screens/qrscanner_screen.dart';
import 'package:vitas_uc/ignoreThisFolder/services/auth.dart';
import 'package:vitas_uc/ignoreThisFolder/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vitas_uc/ignoreThisFolder/unusedModules/home/vitas_list.dart';

class Home extends StatelessWidget {
  //const Home({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Text('bottom sheet'),
            );
          });
    }

    return StreamProvider<List<VitasModel>?>.value(
      initialData: null,
      value: DatabaseService(uid: '').vitas,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Vitas'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            TextButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => _showSettingsPanel(),
            ),
            TextButton.icon(
              icon: Icon(Icons.qr_code_scanner),
              label: Text('qr scanner'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QRScannerScreenOld()));
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: VitasList(),
      ),
    );
  }
}
