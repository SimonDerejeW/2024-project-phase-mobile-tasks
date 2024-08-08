import 'dart:io';

import 'package:ecommerce/data/mockshoeData.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:ecommerce/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatefulWidget {
  final bool isAdd;
  final Shoe? shoe;
  const AddProductPage({super.key, required this.isAdd, this.shoe});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;
  late TextEditingController typeController;
  File? _image;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    if (widget.isAdd) {
      nameController = TextEditingController();
      priceController = TextEditingController();
      descriptionController = TextEditingController();
      typeController = TextEditingController();
    } else {
      
      nameController = TextEditingController(text: widget.shoe?.name ?? '');
      priceController =
          TextEditingController(text: widget.shoe?.price.toString() ?? '');
      descriptionController =
          TextEditingController(text: widget.shoe?.description ?? '');
      typeController = TextEditingController(text: widget.shoe?.type ?? '');
    }
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Store the selected image in _image
      });
    }
  }

  void addShoe() {
    if (_image == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text("Please select an image"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
      return;
    }

    mockData.add(Shoe(
        image: _image!.path,
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

  void updateShoe(Shoe shoe) {
    int index = mockData.indexOf(shoe);
    if (index != -1) {
      mockData[index] = Shoe(
          image: shoe.image,
          name: nameController.text,
          price: double.parse(priceController.text),
          type: typeController.text,
          rating: shoe.rating,
          size: shoe.size,
          description: descriptionController.text);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: const Text(
                  "Successfully updated your product! Go to home page to see your changes"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/');
                    },
                    child: const Text("Go to home page"))
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              content: const Text("Failed to update product"),
            );
          });
    }
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
                GestureDetector(
                  onTap:
                      _pickImage, // Call the _pickImage method when the container is tapped
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(243, 243, 243, 1),
                      borderRadius: BorderRadius.circular(8),
                      image:
                          _image != null // Show the picked image if available
                              ? DecorationImage(
                                  image: FileImage(_image!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                    ),
                    child: _image == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_outlined,
                                size: 40,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Upload Image"),
                            ],
                          )
                        : null,
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
                  onPressed: widget.isAdd
                      ? addShoe
                      : widget.shoe != null
                          ? () => updateShoe(widget.shoe!)
                          : () {},
                ),
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
