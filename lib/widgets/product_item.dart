import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/screens/product_details_screen.dart';

import '../providers/product.dart';
import '../providers/products.dart';

class ProductItem extends StatelessWidget {
  // Product product;
  // ProductItem({required this.product});
  // final String id;
  // final String title;
  // final String imageUrl;
  // ProductItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        // ignore: sort_child_properties_last
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailsScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (context, value, child) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.redAccent,
              ),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),
          backgroundColor: Colors.black38,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
           icon:const Icon(Icons.shopping_cart),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
