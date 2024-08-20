import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/login');
        },
        child: Stack(children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'assets/blue_portrait.jpg',
                fit: BoxFit.cover,
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.3),
                  Theme.of(context).primaryColor.withOpacity(0.7),
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor,
                ],
              ),
              // image: const DecorationImage(
              //   image: AssetImage('assets/blue_portrait.jpg'),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 20),
                  child: Text(
                    'ECOM',
                    style: GoogleFonts.caveatBrush(
                        fontSize: 110,
                        letterSpacing: 5,
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              const Text(
                'ECOMMERCE APP',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    decoration: TextDecoration.none),
              )
            ],
          ))
        ]),
      ),
    );
  }
}
