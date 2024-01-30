import 'package:cloud_firestore/cloud_firestore.dart';

class Apis {
  // TO get all subsollections
  Stream<QuerySnapshot<Object?>>? initialfetch(
    // passing data (wherever we use this initialfetch we need to pass data collection, doc, subcollection)
      String collection, String doc, String subCollection) {
    final CollectionReference productsCollection = FirebaseFirestore.instance
        .collection(collection) //products
        .doc(doc)//docs of id 
        .collection(subCollection); //watches (eg:- smart, quartz)

    return productsCollection.snapshots();
  }
}
