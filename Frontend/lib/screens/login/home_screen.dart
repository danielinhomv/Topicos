import 'package:flutter/material.dart';
import 'package:traductor/components/components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
       appBar: AppBar(
        title:const Text('Home Screen')
       ),
       body: const Text('data')
    );
  }
}