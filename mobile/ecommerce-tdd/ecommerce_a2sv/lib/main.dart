import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bloc_observer.dart';
import 'features/product/domain/entities/product.dart';
import 'features/product/presentation/bloc/product_bloc.dart';
import 'features/product/presentation/pages/add_product_page.dart';
import 'features/product/presentation/pages/home_page.dart';
import 'features/product/presentation/pages/product_details_page.dart';
import 'features/product/presentation/pages/search_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
      child: MaterialApp(
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return _createRoute(const HomePage());
            case '/search':
            return _createRoute(const SearchPage());
            case '/add':
            return _createRoute(const AddProductPage(isAdd: true,));
            case '/update':
            final args = settings.arguments as Product;
            return _createRoute(AddProductPage(isAdd: false,product: args,));
            case '/details':
              final args = settings.arguments as Product;
              return _createRoute(ProductDetailsPage(
                product: args,
              ));
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
      ),
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
