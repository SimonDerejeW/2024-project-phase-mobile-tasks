import 'package:ecommerce/data/mockshoeData.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:ecommerce/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  final bool isAdd;
  const AddProductPage({super.key, required this.isAdd});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController typeController = TextEditingController();

  void addShoe() {
    mockData.add(Shoe(
        image: 'assets/cowboy-boots.jpg',
        name: nameController.text,
        price: double.parse(priceController.text),
        type: typeController.text,
        rating: 4,
        size: [41],
        description: descriptionController.text));

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text(
                "Successfully added your product! Go to home page to see your changes"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/');
                  },
                  child: const Text("Go to home page"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(254, 254, 254, 1),
        appBar: AppBar(
          title: Text(widget.isAdd ? "Add Product" : "Update Product"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(243, 243, 243, 1),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_outlined,
                        size: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Upload Image")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text("Name"),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      fillColor: Color.fromRGBO(243, 243, 243, 1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("Category"),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: typeController,
                  decoration: InputDecoration(
                      fillColor: Color.fromRGBO(243, 243, 243, 1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("Price"),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(
                      hintText: "\$",
                      hintTextDirection: TextDirection.rtl,
                      fillColor: Color.fromRGBO(243, 243, 243, 1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("Description"),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: descriptionController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                      fillColor: Color.fromRGBO(243, 243, 243, 1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomOutlinedButton(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    borderColor: Theme.of(context).primaryColor,
                    buttonWidth: double.maxFinite,
                    buttonHeight: 45,
                    buttonText: widget.isAdd ? "ADD" : "UPDATE",
                    onPressed: addShoe),
                const SizedBox(
                  height: 15,
                ),
                CustomOutlinedButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Color.fromRGBO(255, 19, 19, 0.79),
                    borderColor: Color.fromRGBO(255, 19, 19, 0.79),
                    buttonWidth: double.maxFinite,
                    buttonHeight: 45,
                    buttonText: "DELETE",
                    onPressed: () {}),
              ],
            ),
          ),
        ));
  }
}
