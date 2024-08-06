import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  const ProductCard(
      {super.key,
      required this.image,
      required this.price,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            debugPrint("Card Tapped");
          },
          splashColor: Colors.purple[100],
          child: SizedBox(
            width: 200,
            height: 200,
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Opacity(opacity:0.8, child: AspectRatio(aspectRatio: 18.0/11.0, child: Image.asset(image, fit: BoxFit.cover,))),
                ),
                const SizedBox(height: 7,),
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style:const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(height: 2,),
                      Text('\$$price')
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
