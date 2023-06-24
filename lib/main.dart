import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/screens/product_details_screen.dart';
import 'package:shopapp/screens/products_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => Products()),
        ),
        ChangeNotifierProvider(
          create: ((context) => Cart()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MySop',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            hintColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        routes: {
          ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
        },
        home: ProductOverviewScreen(),
      ),
    );
  }
}
