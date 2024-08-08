import 'package:ecommerce/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(254, 254, 254, 1),
        appBar: AppBar(
          title: Text("Add Product"),
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
                const TextField(
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
                const TextField(
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
                const TextField(
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
                TextFormField(
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
                    buttonText: "ADD",
                    onPressed: () {}),
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
