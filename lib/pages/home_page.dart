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
          body: ListView.builder(
              itemCount: itemsInList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(itemsInList.toString()),
                  subtitle:
                      Text("subtitle", style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.delete, color: Colors.blue),
                );
              }),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueAccent,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(()=>const AddProduct());
            },
          ),
        );
      },
    );
  }
}
