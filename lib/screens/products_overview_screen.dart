import 'package:flutter/material.dart';
import 'package:shopapp/constants/products.dart';
import 'package:shopapp/models/product.dart';
import 'package:shopapp/widgets/product_item.dart';

class ProductOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = PRODUCTS;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: loadedProducts.length,
        itemBuilder: ((context, index) => ProductItem(
              loadedProducts[index].id,
              loadedProducts[index].title,
              loadedProducts[index].imageUrl,
            )),
      ),
    );
  }
}
