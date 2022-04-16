import 'package:flutter/material.dart';

import '../models/models.dart';

class OrderSumaryProductCard extends StatelessWidget {
  const OrderSumaryProductCard({
    Key key,
    this.product,
    this.quantity,
  }) : super(key: key);
  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text('Qtd. ${quantity}',
                    style: Theme.of(context).textTheme.headline6),
              ],
            ),
          ),
          Expanded(
            child: Text(
              'R\$ ${product.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
