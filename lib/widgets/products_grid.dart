import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/constants/products.dart';
import 'package:shopapp/providers/product.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  ProductsGrid({required this.showFavs});
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final loadedProducts = showFavs ? products.favoriteItems : products.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: loadedProducts.length,
      itemBuilder: ((context, index) => ChangeNotifierProvider.value(
            value: loadedProducts[index],
            child: ProductItem(),
          )),
    );
  }
}
