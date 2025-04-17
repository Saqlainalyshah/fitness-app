import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseCRUDProvider = Provider<FirebaseService>((ref) => FirebaseService());

class FirebaseService {
  final _fireStore = FirebaseFirestore.instance;

  Future<bool> documentExists(String collectionPath, String docId) async {
    try {
      DocumentSnapshot doc = await _fireStore.collection(collectionPath).doc(docId).get();
      return doc.exists;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  updateArrayElements(String path, String id, String field, dynamic data) async {
    if (data is List) {
      await _fireStore.collection(path).doc(id).update({
        field: FieldValue.arrayUnion(data)
      });
    } else if (data is Map<String, dynamic>) {
      await _fireStore.collection(path).doc(id).update({
        field: FieldValue.arrayUnion([data])
      });
    } else {
      throw ArgumentError('data must be either a List or a Map<String, dynamic>');
    }
  }

  removeArrayElement(String path, String id, String attribute, dynamic data) async {
    if (data is List) {
      await _fireStore.collection(path).doc(id).update({
        attribute: FieldValue.arrayRemove(data)
      });
    } else if (data is Map<String, dynamic>) {
      await _fireStore.collection(path).doc(id).update({
        attribute: FieldValue.arrayRemove([data])
      });
    } else {
      throw ArgumentError('data must be either a List or a Map<String, dynamic>');
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getDocuments(String collectionName) {
    return _fireStore.collection(collectionName).snapshots();
  }
 Future<DocumentSnapshot<Map<String,dynamic>>?> getDoc(String collectionPath, String docId)async{
    try{
      DocumentSnapshot<Map<String,dynamic>>? documentSnapshot= await _fireStore.collection(collectionPath).doc(docId).get();
       return documentSnapshot;
    }catch (e){
      return null;
    }
 }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSubCollectionDocuments(String collectionName, String id, String subCollectionPath) {
    return _fireStore.collection(collectionName).doc(id).collection(subCollectionPath).snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>>? getDocumentById(String collectionName, String id) {
    try {
      return _fireStore.collection(collectionName).doc(id).snapshots();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> createDocumentWithId(String collectionPath, String id, dynamic data) async {
    bool result;
    try {
      await _fireStore.collection(collectionPath).doc(id).set(data);
      result = true;
    } catch (e) {
      result = false;
      print(e.toString());
    }
    return result;
  }

  Future createSubCollection(String collectionPath, String subCollectionPath, String id, dynamic data) async {
    try {
      await _fireStore.collection(collectionPath).doc(id).collection(subCollectionPath).add(data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future updateDocument(String collectionPath, String docId, dynamic data) async {
    try {
      await _fireStore.collection(collectionPath).doc(docId).update(data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteDocument(String collectionPath, String docId) async {
    try {
      await _fireStore.collection(collectionPath).doc(docId).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
