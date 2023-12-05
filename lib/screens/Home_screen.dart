import 'package:flutter/material.dart';
import 'package:nyntra/models/My_products.dart';
import 'package:nyntra/screens/detail_screen.dart';
import 'package:nyntra/widgets/product_card.dart';

class HomeScreenscnd extends StatefulWidget {
  const HomeScreenscnd({super.key});

  @override
  State<HomeScreenscnd> createState() => _HomeScreenscndState();
}

class _HomeScreenscndState extends State<HomeScreenscnd> {
  int isselected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Our Products",
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildproductcategory(index: 0, name: "All products"),
              _buildproductcategory(index: 2, name: "sneakers"),
              _buildproductcategory(index: 1, name: "Jackets")
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: isselected == 0
                ? _buildAllproducts()
                : isselected == 1
                    ? _buildjecketsproducts()
                    : _buildsneakersproducts(),
          )
        ],
      ),
    );
  }

  _buildproductcategory({required int index, required String name}) =>
      GestureDetector(
        onTap: () {
          setState(() {
            isselected = index;
          });
        },
        child: Container(
          width: 100,
          height: 40,
          margin: const EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isselected == index
                  ? const Color.fromARGB(255, 7, 138, 164)
                  : const Color.fromARGB(255, 148, 159, 168),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );

  _buildAllproducts() => Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          scrollDirection: Axis.vertical,
          itemCount: Myproducts.allproducts.length,
          itemBuilder: (context, index) {
            final allProducts = Myproducts.allproducts[index];
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(Products: allProducts)));
                },
                child: ProductCard(Products: allProducts));
          },
        ),
      );

  _buildjecketsproducts() => Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          scrollDirection: Axis.vertical,
          itemCount: Myproducts.jackets.length,
          itemBuilder: (context, index) {
            final jacketslist = Myproducts.jackets[index];
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(Products: jacketslist)));
                },
                child: ProductCard(Products: jacketslist));
          },
        ),
      );

  _buildsneakersproducts() => Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          scrollDirection: Axis.vertical,
          itemCount: Myproducts.sneakers.length,
          itemBuilder: (context, index) {
            final sneakersslist = Myproducts.sneakers[index];
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(Products: sneakersslist)));
                },
                child: ProductCard(Products: sneakersslist));
          },
        ),
      );
}
