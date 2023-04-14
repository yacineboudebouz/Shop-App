import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/screens/product_details_screen.dart';
import 'package:shopapp/screens/products_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:  (context) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MySop',
        
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato'
        ),routes:  {
          ProductDetailsScreen.routeName :(context) => ProductDetailsScreen(),
        },
        home: ProductOverviewScreen(),
      ),
    );
  }
}



