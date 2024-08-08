import 'package:ecommerce/data/mockshoeData.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:ecommerce/widgets/modal_sheet.dart';
import 'package:ecommerce/widgets/shoe_card.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  void showModal(BuildContext context) {
    showModalBottomSheet<void>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero
        ),
        context: context,
        builder: (BuildContext context) {
          return ModalSheet();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Product"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 280,
                  height: 44,
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 5, left: 15),
                        suffixIcon: Icon(
                          Icons.arrow_forward,
                          color: Theme.of(context).primaryColor,
                        ),
                        hintText: "Leather",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12))),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () => showModal(context),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        border: Border.all(
                            width: 2, color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.filter_list,
                          color: Colors.white,
                        ),
                      )),
                ),
                const SizedBox(width: 15,)
              ],
            ),
            const SizedBox(height: 30,),
            Expanded(
              child: ListView.builder(
                  itemCount: mockData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ShoeCard(
                        shoe: Shoe(image: mockData[index].image, name: mockData[index].name, price: mockData[index].price, type: mockData[index].type, rating: mockData[index].rating, size: mockData[index].size, description: mockData[index].description),
                        );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
