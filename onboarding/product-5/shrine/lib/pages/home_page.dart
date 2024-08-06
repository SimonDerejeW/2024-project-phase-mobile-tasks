import 'package:flutter/material.dart';
import 'package:shrine/data/mock_data.dart';
import 'package:shrine/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  // final List<Map> data = [
  //   {"image": "assets/blue_dunk.png", "title": "Blue Dunk", "price": 50.99},
  //   {"image": "assets/blue_dunk.png", "title": "Blue Dunk", "price": 50.99},
  //   {"image": "assets/blue_dunk.png", "title": "Blue Dunk", "price": 50.99},
  //   {"image": "assets/blue_dunk.png", "title": "Blue Dunk", "price": 50.99},
  //   {"image": "assets/blue_dunk.png", "title": "Blue Dunk", "price": 50.99},
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SHRINE"),
        actions: [
          IconButton(
              onPressed: () {
                debugPrint("Search Button Pressed");
              },
              icon: const Icon(
                Icons.search,
                semanticLabel: "Search",
              )),
          IconButton(
              onPressed: () {
                debugPrint("Filter Button Pressed");
              },
              icon: const Icon(
                Icons.tune,
                semanticLabel: "Filter",
              ))
        ],
      ),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: mockData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 4),
            itemBuilder: (BuildContext context, int index) {
              return ProductCard(
                  image: mockData[index]['image'],
                  price: mockData[index]['price'],
                  title: mockData[index]['title']);
            }),
      ),
    );
  }
}
