import 'package:flutter/material.dart';
import '../models/shoe.dart';


class ShoeCard extends StatelessWidget {
  final Shoe shoe;
  const ShoeCard({
    super.key,
    required this.shoe,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/details',
                arguments: Shoe(
                    image: shoe.image,
                    name: shoe.name,
                    price: shoe.price,
                    type: shoe.type,
                    rating: shoe.rating,
                    size: shoe.size,
                    description: shoe.description));
          },
          splashColor: Colors.blue[100],
          child: SizedBox(
            width: 380,
            height: 280,
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: SizedBox(
                      width: double.infinity,
                      child: Opacity(
                        opacity: 0.8,
                        child: Image.asset(
                          shoe.image,
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
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
                                    "(${shoe.rating})",
                                    style: const TextStyle(color: Colors.black45),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
