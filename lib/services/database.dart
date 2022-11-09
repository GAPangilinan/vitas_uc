import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:vitas/models/vitasmodel.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  //Collection Reference
  final CollectionReference vitasCollection =
      FirebaseFirestore.instance.collection('vitas');

  Future updateUserData(
      String username, String cashierstatus, String mwstatus) async {
    return await vitasCollection.doc(uid).set({
      'username': username,
      'cashierstatus': cashierstatus,
      'mwstatus': mwstatus,
    });
  }

  //Vitas list from snapshot
  List<VitasModel> _vitasListFromSnapshot(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((doc) {
        return VitasModel(
          username: doc.get('username') ?? '',
          cashierstatus: doc.get('cashierstatus') ?? '',
          mwstatus: doc.get('mwstatus') ?? '',
        );
      }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  //Get vitas stream
  Stream<List<VitasModel>> get vitas {
    return vitasCollection.snapshots().map(_vitasListFromSnapshot);
  }
}
