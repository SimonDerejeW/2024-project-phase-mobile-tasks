import 'package:flutter/material.dart';
import '../data/mock_shoe_data.dart';
import '../models/shoe.dart';
import '../widgets/custom_outlined_button.dart';

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
                'Successfully added your product! Go to home page to see your changes'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/');
                  },
                  child: const Text('Go to home page'))
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
                  'Successfully updated your product! Go to home page to see your changes'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/');
                    },
                    child: const Text('Go to home page'))
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              content: const Text('Failed to update product'),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(254, 254, 254, 1),
        appBar: AppBar(
          title: Text(widget.isAdd ? 'Add Product' : 'Update Product'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(243, 243, 243, 1),
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
                      Text('Upload Image')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text('Name'),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: nameController,
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
                const Text('Category'),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: typeController,
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
                const Text('Price'),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(
                      hintText: '\$',
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
                const Text('Description'),
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
                  buttonText: widget.isAdd ? 'ADD' : 'UPDATE',
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
                    foregroundColor: const Color.fromRGBO(255, 19, 19, 0.79),
                    borderColor: const Color.fromRGBO(255, 19, 19, 0.79),
                    buttonWidth: double.maxFinite,
                    buttonHeight: 45,
                    buttonText: 'DELETE',
                    onPressed: () {}),
              ],
            ),
          ),
        ));
  }
}
