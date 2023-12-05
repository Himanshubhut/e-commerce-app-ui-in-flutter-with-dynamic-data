import 'package:flutter/material.dart';
import 'package:nyntra/models/products.dart';
import 'package:nyntra/providers/favorite_provider.dart';

class ProductCard extends StatefulWidget {
  final product Products;
  const ProductCard({
    super.key,
    required this.Products,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Container(
        width: MediaQuery.of(context).size.width / 2,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color.fromARGB(255, 255, 255, 255)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    provider.toggleFavorite(widget.Products);
                  },
                  child: Icon(
                    provider.isExist(widget.Products)
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: Colors.red,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 110,
              width: 110,
              child: Image.asset(
                widget.Products.image,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              widget.Products.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.Products.category,
              style: TextStyle(fontSize: 14, color: Colors.red),
            ),
            Text('\$' '${widget.Products.price}')
          ],
        ));
  }
}
