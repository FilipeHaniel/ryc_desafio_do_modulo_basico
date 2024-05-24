import 'package:flutter/material.dart';
import 'package:ryc_desafio_do_modulo_basico/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedItem = 0;

  static const List<Widget> _appScreen = [
    HomePage(),
    Text('index 1 out'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('main page')),
      body: _appScreen[selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedItem,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge),
            label: 'information',
          ),
        ],
        onTap: (value) {
          setState(() {
            selectedItem = value;
          });
        },
      ),
    );
  }
}
