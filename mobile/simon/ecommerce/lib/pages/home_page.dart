import 'package:ecommerce/data/mockshoeData.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:ecommerce/widgets/shoe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add');
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        shape: CircleBorder(),
      ),
      appBar: AppBar(
        leadingWidth: 70,
        // toolbarHeight: 80,
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Image.asset(
              'assets/profile_picture.png',
              width: 45,
              height: 55,
            ),
          ),
        ),
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Text(
                "Aug 7, 2024",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black45,
                    fontSize: 13),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              children: [
                Text(
                  "Hello, ",
                  style: TextStyle(color: Colors.black45, fontSize: 15),
                ),
                Text(
                  "Amelia",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                )
              ],
            )
          ],
        ),
        actions: [
          Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(5),
              ),
              child: InkWell(
                  onTap: () {},
                  splashColor: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(children: [
                      Icon(Icons.notifications_none_rounded),
                      Positioned(
                          top: 3,
                          right: 5,
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 63, 81, 243)),
                          ))
                    ]),
                  ))),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Available Products",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/search');
                        },
                        splashColor: Colors.grey.shade300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey.shade600,
                          ),
                        )))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: mockData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ShoeCard(
                      shoe: Shoe(
                          image: mockData[index].image,
                          name: mockData[index].name,
                          price: mockData[index].price,
                          type: mockData[index].type,
                          rating: mockData[index].rating,
                          size: mockData[index].size,
                          description: mockData[index].description),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
