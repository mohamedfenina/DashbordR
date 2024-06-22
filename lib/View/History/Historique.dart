import 'package:cloud_firestore/cloud_firestore.dart';

class Historique {

Stream<QuerySnapshot> getDoneTaskStream() {
  return FirebaseFirestore.instance
      .collection('Commentaire')
      .orderBy('date',descending: true)
      .snapshots();
}
Stream<QuerySnapshot> getPendingTaskStream() {
  return FirebaseFirestore.instance
      .collection('Rate')
      .orderBy('date',descending: true)
      .snapshots();
}

}