import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/category/category_bloc.dart';
import '../../blocs/product/product_bloc.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({Key key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppBar(
        title: "A.L Boutique",
      ),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is CategoryLoaded) {
                  return CarouselSlider(
                    items: state.categories
                        .map((category) => HeroCarouselCard(
                              category: category,
                            ))
                        .toList(),
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                    ),
                  );
                } else {
                  return const Text("Algo de errado aconteceu! :(");
                }
              },
            ),
            const SectionTitle(title: 'Recomendado'),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                  return ProductCarousel(
                      width: width,
                      products: state.products
                          .where((product) => product.isRecommended)
                          .toList());
                } else {
                  return const Text("Algo de errado aconteceu! :(");
                }
              },
            ),
            const SectionTitle(
              title: "Populares",
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                  return ProductCarousel(
                      width: width,
                      products: state.products
                          .where((product) => product.isPopular)
                          .toList());
                } else {
                  return const Text("Algo de errado aconteceu! :(");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
