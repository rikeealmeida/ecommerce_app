// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/blocs/wishlist/wishlist_event.dart';

import '../blocs/cart/cart_bloc.dart';
import '../blocs/checkout/checkout_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../blocs/wishlist/wishlist_state.dart';
import '../models/models.dart';

class CustomNavBar extends StatelessWidget {
  final String screen;
  final Product product;
  const CustomNavBar({
    Key key,
    this.screen,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _selectNavBar(context, screen),
          // IconButton(
          //   onPressed: () {
          //     Navigator.pushReplacementNamed(context, '/home');
          //   },
          //   icon: const Icon(
          //     Icons.home,
          //     color: Colors.white,
          //   ),
          // ),
          // IconButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, '/cart');
          //   },
          //   icon: const Icon(
          //     Icons.shopping_cart,
          //     color: Colors.white,
          //   ),
          // ),
          // IconButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, 'user');
          //   },
          //   icon: const Icon(
          //     Icons.person,
          //     color: Colors.white,
          //   ),
          // ),
        ),
      ),
    );
  }

  List<Widget> _selectNavBar(context, screen) {
    switch (screen) {
      case '/home':
        return _buildNavBar(context);
      case '/catalog':
        return _buildNavBar(context);
      case '/wishlist':
        return _buildNavBar(context);
      case '/order-confirmation':
        return _buildNavBar(context);
      case '/product':
        return _buildAddToCartNavBar(context, product);
      case '/cart':
        return _buildGoToCheckoutNavBar(context);
      case '/checkout':
        return _buildOrderNowNavBar(context);

      default:
        _buildNavBar(context);
    }
  }

  List<Widget> _buildNavBar(context) {
    return [
      IconButton(
        icon: Icon(Icons.home, color: Colors.white),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
      ),
      IconButton(
        icon: Icon(Icons.shopping_cart, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
      ),
      IconButton(
        icon: Icon(Icons.person, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, '/user');
        },
      )
    ];
  }

  List<Widget> _buildAddToCartNavBar(context, product) {
    return [
      IconButton(
        icon: Icon(Icons.share, color: Colors.white),
        onPressed: () {},
      ),
      BlocBuilder<WishListBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return CircularProgressIndicator();
          }
          if (state is WishlistLoaded) {
            return IconButton(
              icon: Icon(Icons.favorite, color: Colors.white),
              onPressed: () {
                final snackBar =
                    SnackBar(content: Text('Adicionado a lista de desejos'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                context.read<WishListBloc>().add(AddProductToWishList(product));
              },
            );
          }
          return Text('Algo de errado aconteceu!');
        },
      ),
      BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return CircularProgressIndicator();
          }
          if (state is CartLoaded) {
            return ElevatedButton(
              onPressed: () {
                context.read<CartBloc>().add(AddProduct(product));
                Navigator.pushNamed(context, '/cart');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(),
              ),
              child: Text(
                'Adicionar ao carrinho',
                style: Theme.of(context).textTheme.headline3,
              ),
            );
          }
          return Text('Algo de errado aconteceu!');
        },
      )
    ];
  }

  List<Widget> _buildGoToCheckoutNavBar(context) {
    return [
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/checkout');
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(),
        ),
        child: Text(
          'Finalizar compra',
          style: Theme.of(context).textTheme.headline3,
        ),
      )
    ];
  }

  List<Widget> _buildOrderNowNavBar(context) {
    return [
      BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CheckoutLoaded) {
            return ElevatedButton(
              onPressed: () {
                context
                    .read<CheckoutBloc>()
                    .add(ConfirmCheckout(checkout: state.checkout));

                Navigator.pushNamed(context, '/order-confirmation');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(),
              ),
              child: Text(
                'Finalizar',
                style: Theme.of(context).textTheme.headline3,
              ),
            );
          } else {
            return Text('Algo de errado aconteceu');
          }
        },
      )
    ];
  }
}
