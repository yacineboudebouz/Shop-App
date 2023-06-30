import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';

class CartItemWid extends StatelessWidget {
  final String id;
  final String productid;
  final double price;
  final int quantity;
  final String title;
  CartItemWid({
    required this.id,
    required this.productid,
    required this.title,
    required this.price,
    required this.quantity,
  });
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productid);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        child: const Icon(
          Icons.delete,
          size: 30,
          color: Colors.white,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(child: Text('\$$price')),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${price * quantity}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
