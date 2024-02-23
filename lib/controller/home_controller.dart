import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // create an instance of firebase
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Collection reference to read the collections and id's
  late CollectionReference collectionReference;

//   add products
  addProduct(
    String productNameCtrl,
    String productDescriptionCtrl,
    String productImageUrlCtrl,
    double productPriceCtrl,
    String category,
    String brand,
    bool offer,
  ) {
    try {
      // add a document
      DocumentReference documentReference = collectionReference.doc();
      Product product = Product(
        id: documentReference.id,
        name: productNameCtrl,
        category: category,
        description: productDescriptionCtrl,
        price: productPriceCtrl,
        brand: brand,
        imageUrl: productImageUrlCtrl,
        offer: offer,
      );

      //   convert product to JSON
      final productJson = product.toJson();
      //   add the prod to document
      documentReference.set(productJson);
      Get.snackbar("Success", "Product add successfully",
          colorText: Colors.green);
      // setValuesToDefault();
    } catch (e) {
      Get.snackbar("Failed", "Product failed to add", colorText: Colors.red);
    }
  }

  @override
  void onInit() {
    collectionReference = firestore.collection('products');
    super.onInit();
  }

  setValuesToDefault() {}
}
