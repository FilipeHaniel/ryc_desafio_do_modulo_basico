import 'package:flutter/material.dart';
import 'package:ryc_desafio_do_modulo_basico/presentation/presenter/main_presenter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    // TODO(dev): Alterar inicialização para injeção de dependencia
    var presenter = MainPresenter(widget.createState());

    return Scaffold(
      appBar: AppBar(title: const Text('main page')),
      body: presenter.selectPage(selectedItem),
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
