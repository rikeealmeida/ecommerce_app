import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter_ecommerce/blocs/wishlist/wishlist_state.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';

class WishList extends StatelessWidget {
  static const String routeName = '/wishlist';

  const WishList({Key key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const WishList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Lista de desejos",
      ),
      body: BlocBuilder<WishListBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WishlistLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2.4,
              ),
              itemCount: state.wishlist.products.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: ProductCard(
                    product: state.wishlist.products[index],
                    widthFactor: 1.1,
                    leftPosition: 100,
                    isWhishlist: true,
                  ),
                );
              },
            );
          } else {
            return const Text("Algo de errado aconteceu! :(");
          }
        },
      ),
    );
  }
}
