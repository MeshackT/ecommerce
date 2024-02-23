import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/widgets/drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String? categoryOption;
  String? brandOption;
  String? offerOption;

  List<String> categoryItems = [];
  List<String> brandItems = [];
  List<String> offerItems = [];

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImageUrlCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  _initializeTheseFirst() async {
    categoryItems.add("Category");
    categoryItems.add("Sneaker");
    categoryItems.add("Boot");
    categoryItems.add("Sandals");
    categoryOption = categoryItems.first.toString();
    brandItems.add("Brand");
    brandItems.add("Adidas");
    brandItems.add("Nike");
    brandItems.add("Puma");
    brandOption = brandItems.first.toString();
    offerItems.add("true");
    offerItems.add("false");
    offerOption = offerItems.first;
  }

  @override
  void initState() {
    super.initState();
    _initializeTheseFirst();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Add New Product",
              style: TextStyle(
                fontSize: 20,
                color: Colors.indigoAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: productNameCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: Text("name"),
                      hintText: "Enter name",
                    ),
                    onSaved: (index) {
                      productNameCtrl.text = index!;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: productDescriptionCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: Text("Product description"),
                      hintText: "Enter product description",
                    ),
                    maxLines: 5,
                    onSaved: (index) {
                      productDescriptionCtrl.text = index!;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: productImageUrlCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: Text("Image Url"),
                      hintText: "https://...",
                    ),
                    onSaved: (index) {
                      productImageUrlCtrl.text = index!;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: productPriceCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: Text("Product Price"),
                      hintText: "e.g. R200",
                    ),
                    onSaved: (index) {
                      productPriceCtrl.text = index!;
                      print(productPriceCtrl.text);
                    },
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    children: [
                      const SizedBox(height: 10),
                      DropDown(
                        dropDownValue: categoryOption.toString(),
                        items: categoryItems,
                        onChanged: (value) {
                          categoryOption = value;
                          ctrl.update();
                        },
                      ),
                      const SizedBox(width: 10),
                      DropDown(
                        dropDownValue: brandOption.toString(),
                        items: brandItems,
                        onChanged: (value) {
                          brandOption = value;
                          ctrl.update();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Product Offer?",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.indigoAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  DropDown(
                    dropDownValue: offerOption.toString(),
                    items: offerItems,
                    onChanged: (value) {
                      offerOption = value;
                      ctrl.update();
                    },
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextButton(
                      onPressed: () {
                        double? newPrice =
                            double.tryParse(productPriceCtrl.text);
                        bool newBool = bool.tryParse(offerOption!)!;

                        if (productNameCtrl.text.isNotEmpty ||
                            productPriceCtrl.text.isNotEmpty ||
                            productImageUrlCtrl.text.isNotEmpty ||
                            productDescriptionCtrl.text.isNotEmpty ||
                            categoryOption!.isNotEmpty ||
                            brandOption!.isNotEmpty ||
                            offerOption!.isNotEmpty) {
                          // add an Item
                          ctrl.addProduct(
                              productNameCtrl.text,
                              productDescriptionCtrl.text,
                              productImageUrlCtrl.text,
                              newPrice!,
                              categoryOption!,
                              brandOption!,
                              newBool);

                          // clear the product by clicking the button
                          productNameCtrl.clear();
                          productDescriptionCtrl.clear();
                          productPriceCtrl.clear();
                          productImageUrlCtrl.clear();
                          categoryOption = categoryItems.first.toString();
                          brandOption = brandItems.first.toString();
                          offerOption = offerItems.first;
                          ctrl.update();
                        } else {
                          Get.snackbar(
                              backgroundColor: Colors.blue,
                              "Error",
                              "Enter the above details",
                              colorText: Colors.white);
                        }

                        print(
                            "on add page: $categoryOption\n$brandOption$offerOption");
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
