
import 'package:flutter/material.dart';

import '../models/models.dart';
import 'widgets.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({
    Key key,
    @required this.width,
    this.products,
  }) : super(key: key);

  final double width;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: ProductCard(
              product: products[index],
            ),
          );
        },
      ),
    );
  }
}
