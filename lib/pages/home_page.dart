import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/pages/add_product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final itemsInList = {
    {"name": "Meshack"},
    {"name": "Templeton"},
    {"name": "Nkosi"}
  };

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Products",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.w800),
            ),
          ),
          body: ctrl.products.isNotEmpty
              ? ListView.builder(
                  itemCount: ctrl.products.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(ctrl.products[index].name!,
                          style: TextStyle(color: Colors.blue)),
                      subtitle: Text(
                          ctrl.products[index].price.toString() ?? "",
                          style: TextStyle(color: Colors.blue)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.blue),
                        onPressed: () {
                          // delete the product
                          ctrl.deleteProduct(ctrl.products[index].id!);
                        },
                      ),
                    );
                  })
              : TextButton(
                  child: Text("Test"),
                  onPressed: () {
                    ctrl.fetchProduct();
                  },
                ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueAccent,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(() => const AddProduct());
            },
          ),
        );
      },
    );
  }
}
