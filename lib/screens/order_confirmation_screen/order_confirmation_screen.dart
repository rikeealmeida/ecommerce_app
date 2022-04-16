import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/product_model.dart';
import 'package:flutter_ecommerce/widgets/widgets.dart';
import 'package:flutter_svg/svg.dart';


class OrderConfirmation extends StatelessWidget {
  const OrderConfirmation({Key key}) : super(key: key);
  static const String routeName = '/order-confirmation';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const OrderConfirmation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Confirmação de Pedido'),
      bottomNavigationBar: const CustomNavBar(
        screen: routeName,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: 300,
                ),
                Positioned(
                  top: 110,
                  left: (MediaQuery.of(context).size.width - 80) / 2,
                  child: SvgPicture.asset(
                    'assets/svgs/party-popper-svgrepo-com.svg',
                    color: Colors.white,
                    height: 120,
                    width: 120,
                  ),
                ),
                Positioned(
                  top: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Seu pedido está completo!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(color: Colors.white),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Código do pedido: 2ijr23rj',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Obrigado pela preferência! 😁❤️',
                      style: Theme.of(context).textTheme.headline6),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Código do pedido: 2ijr23rj',
                      style: Theme.of(context).textTheme.headline5),
                  const SizedBox(
                    height: 20,
                  ),
                  const OrderSumary(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Detalhes do pedido',
                      style: Theme.of(context).textTheme.headline5),
                  const Divider(thickness: 2),
                  const SizedBox(
                    height: 5,
                  ),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    children:  [
                      OrderSumaryProductCard(product: Product.products[0],),
                      OrderSumaryProductCard(product: Product.products[1],),
                      OrderSumaryProductCard(product: Product.products[2],),
                      OrderSumaryProductCard(product: Product.products[3],),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
