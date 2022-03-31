import 'package:equatable/equatable.dart';

import 'package:flutter_ecommerce/models/product_model.dart';

class Checkout extends Equatable {
  final String fullName;
  final String email;
  final String address;
  final String city;
  final String country;
  final String zipCode;
  final List<Product> products;
  final String subtotal;
  final String deliveryFee;
  final String total;

  const Checkout({
     this.fullName,
     this.email,
     this.address,
     this.city,
     this.country,
     this.zipCode,
     this.products,
     this.subtotal,
     this.deliveryFee,
     this.total,
  });

  @override
  List<Object> get props => [
        fullName,
        email,
        address,
        city,
        country,
        zipCode,
        products,
        subtotal,
        deliveryFee,
        total,
      ];

  Map<String, Object> toDocument() {
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['zipCode'] = zipCode;

    return {
      'customerAddress': customerAddress,
      'customerName': fullName,
      'customerEmail': email,
      'products': products.map((product) => product.name).toList(),
      'subtotal': subtotal,
      'deliveryFee': deliveryFee,
      'total': total
    };
  }
}
