import 'package:flutter/material.dart';
import 'package:traductor/screens/screens.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({super.key});

  @override
  State<SplashScreeen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {

  @override
  void initState() {
   var duracion = const Duration(seconds: 5);
  
  Future.delayed(duracion,() {
  Navigator.pushAndRemoveUntil(
  context, 
  MaterialPageRoute(builder: (context) {return const HomeScreen();}), 
  (route) => false);
  });
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/utils/splash1.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
