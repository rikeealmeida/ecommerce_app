import 'package:equatable/equatable.dart';

import '../../models/models.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class LoadWishList extends WishlistEvent {}

class AddProductToWishList extends WishlistEvent {
  final Product product;

  const AddProductToWishList(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProductFromWishList extends WishlistEvent {
  final Product product;

  const RemoveProductFromWishList(this.product);

  @override
  List<Object> get props => [product];
}
