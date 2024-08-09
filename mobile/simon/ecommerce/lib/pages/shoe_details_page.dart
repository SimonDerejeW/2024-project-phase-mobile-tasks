import 'package:flutter/material.dart';

import '../data/mock_shoe_data.dart';
import '../data/mock_size_data.dart';
import '../models/shoe.dart';
import '../widgets/chips.dart';
import '../widgets/custom_outlined_button.dart';

class ShoeDetailsPage extends StatelessWidget {
  final Shoe shoe;
  const ShoeDetailsPage({
    super.key,
    required this.shoe,
  });

  void deleteShoe(BuildContext context) {
    bool status = mockData.remove(shoe);
    if (status) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: const Text('Successfully deleted product')));
      Navigator.of(context).pushNamed('/');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to delete the product')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: const Color.fromRGBO(254, 254, 254, 1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(children: [
              Image.asset(
                shoe.image,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.32,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 40,
                left: 10,
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.indigoAccent.shade400,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        shoe.type,
                        style: const TextStyle(color: Colors.black45),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rate,
                            color: Colors.amber[400],
                          ),
                          Text(
                            '(${shoe.rating})',
                            style: const TextStyle(color: Colors.black45),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        shoe.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      Text(
                        '\$${shoe.price}',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Size:',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 60,
                      child: ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: shoeSize.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (shoe.size.contains(shoeSize[index])) {
                            return Chips(
                              number: shoeSize[index],
                              selected: true,
                            );
                          } else {
                            return Chips(
                              number: shoeSize[index],
                              selected: false,
                            );
                          }
                        },
                        separatorBuilder: (BuildContext context, _) {
                          return const SizedBox(
                            width: 6,
                          );
                        },
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(shoe.description),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomOutlinedButton(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color.fromRGBO(255, 19, 19, 0.79),
                          borderColor: const Color.fromRGBO(255, 19, 19, 0.79),
                          buttonWidth: 120,
                          buttonHeight: 45,
                          buttonText: 'DELETE',
                          onPressed: () => deleteShoe(context)),
                      CustomOutlinedButton(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                          borderColor: Theme.of(context).primaryColor,
                          buttonWidth: 120,
                          buttonHeight: 45,
                          buttonText: 'UPDATE',
                          onPressed: () {
                            Navigator.of(context).pushNamed('/update',
                                arguments: Shoe(
                                    image: shoe.image,
                                    name: shoe.name,
                                    price: shoe.price,
                                    type: shoe.type,
                                    rating: shoe.rating,
                                    size: shoe.size,
                                    description: shoe.description));
                          })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
