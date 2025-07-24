import 'package:flutter/material.dart';
import 'package:reco_task/features/cart/presentation/view/cart_view.dart';
import 'package:reco_task/features/menu/presentation/views/menu_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pages = [MenuView(), CartView()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue[400],
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        onTap: (index) {
          setState(() {});
          _currentIndex = index;
        },
      ),
      body: pages[_currentIndex],
    );
  }
}
