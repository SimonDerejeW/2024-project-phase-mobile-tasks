import 'package:ecommerce/models/shoe.dart';
import 'package:ecommerce/pages/add_product_page.dart';
import 'package:ecommerce/pages/home_page.dart';
import 'package:ecommerce/pages/search_page.dart';
import 'package:ecommerce/pages/shoe_details_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return _createRoute(const HomePage());
          case '/search':
            return _createRoute(const SearchPage());
          case '/add':
            return _createRoute(const AddProductPage());
          case '/details':
            final args = settings.arguments as Shoe;
            return _createRoute(ShoeDetailsPage(shoe: args,));
          default:
            return null;
        }
      },
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          primaryColor: const Color.fromARGB(255, 63, 81, 243),
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 63, 81, 243))),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

PageRouteBuilder _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeIn;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
