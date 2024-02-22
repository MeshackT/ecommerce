import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // create an instance of firebase
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Collection reference to read the collections and id's
  late CollectionReference collectionReference;

  @override
  void onInit() {
    collectionReference = firestore.collection('products');
    super.onInit();
  }

//   add products
  addProduct() {
    // add a document
    DocumentReference documentReference = collectionReference.doc();
    {}
  }
}
