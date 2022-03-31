import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/cart/cart_bloc.dart';
import '../../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  const CartScreen({Key key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Carrinho",
      ),
      bottomNavigationBar:const CustomNavBar(screen: routeName),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.cart.freeDeliveryString,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: const RoundedRectangleBorder(),
                                  elevation: 0),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Adicionar itens',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 400,
                                  child: ListView.builder(
                                    itemCount: state.cart
                                        .productQuantity(state.cart.products)
                                        .keys
                                        .length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return CartProductCard(
                                        product: state.cart
                                            .productQuantity(
                                                state.cart.products)
                                            .keys
                                            .elementAt(index),
                                        quantity: state.cart
                                            .productQuantity(
                                                state.cart.products)
                                            .values
                                            .elementAt(index),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  OrderSumary(),
                ],
              ),
            );
          } else {
            return Text("Algo deu errado!");
          }
        },
      ),
    );
  }
}
