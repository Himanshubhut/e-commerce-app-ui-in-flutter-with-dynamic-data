import 'package:flutter/material.dart';
import 'package:nyntra/models/products.dart';
import 'package:nyntra/providers/cart_provider.dart';
import 'package:nyntra/screens/cart_details.dart';
import 'package:nyntra/widgets/avaliable_size.dart';

class DetailScreen extends StatefulWidget {
  final product Products;
  const DetailScreen({super.key, required this.Products});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final Provider = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 138, 164),
        title: const Text(
          "Detail",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 220,
                height: 220,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 87, 72, 72)),
                child: Image.asset(
                  widget.Products.image,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          const SizedBox(height: 35),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 400,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.Products.name.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$' '${widget.Products.price}',
                      style: const TextStyle(fontSize: 23),
                    )
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  widget.Products.descripation,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 14),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "avalibale size",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        AvaliableSize(size: "US 5"),
                        AvaliableSize(size: "US 6"),
                        AvaliableSize(size: "US 7"),
                        AvaliableSize(size: "US 8"),
                      ],
                    )),
                const SizedBox(height: 15),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Avalibale color",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.yellow,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.green,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.blue,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomSheet: BottomAppBar(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 10,
        decoration: const BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: Radius.circular(10))),
        child: Row(
          children: [
            Text(
              '\$' '${widget.Products.price}',
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              width: 170,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  Provider.toggleProduct(widget.Products);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartDetail()));
                },
                icon: const Icon(
                  Icons.send,
                  color: Colors.redAccent,
                ),
                label: const Text(
                  'add to cart',
                  style: TextStyle(color: Colors.redAccent),
                ))
          ],
        ),
      )),
    );
  }
}
