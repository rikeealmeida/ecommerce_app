import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/blocs/wishlist/wishlist_event.dart';
import 'package:flutter_ecommerce/blocs/wishlist/wishlist_state.dart';

import '../../models/models.dart';

class WishListBloc extends Bloc<WishlistEvent, WishlistState> {
  WishListBloc() : super(WishlistLoading()) {
    on<LoadWishList>(_onLoadWishList);
    on<AddProductToWishList>(_onAddProductToWishList);
    on<RemoveProductFromWishList>(_onRemoveProductFromWishList);
  }
  void _onLoadWishList(event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const WishlistLoaded());
    } on Exception {
      emit(WishlistError());
    }
  }

  void _onAddProductToWishList(event, Emitter<WishlistState> emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
          wishlist: Wishlist(
              products: List.from(state.wishlist.products)..add(event.product)),
        ));
      } on Exception {
        emit(WishlistError());
      }
    }
  }

  void _onRemoveProductFromWishList(event, Emitter<WishlistState> emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
          wishlist: Wishlist(
              products: List.from(state.wishlist.products)
                ..remove(event.product)),
        ));
      } on Exception {
        emit(WishlistError());
      }
    }
  }
}
