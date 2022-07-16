import 'package:cloud_firestore/cloud_firestore.dart';

abstract class GenerateDocumentID{

  String generateId({String collection, String doc});
}

class GenerateDocumentIDReal implements GenerateDocumentID {
  @override
  String generateId({String collection, String doc}) {

    if(collection == null){
      collection = "users";
    }

    if(doc == null){
      doc = "new_doc";
    }
    FirebaseFirestore firestore = FirebaseFirestore.instance;

   return firestore.collection(collection).doc().id;

  }

}

class GenerateDocumentIDFake implements GenerateDocumentID {
  @override
  String generateId({String collection, String doc}) {

    if(collection == null){
      collection = "users";
    }

    if(doc == null){
      doc = "new_doc";
    }
    FirebaseFirestore firestore = FirebaseFirestore.instance;

   return firestore.collection(collection).doc().id;

  }

}