import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      appBar: AppBar(
        toolbarHeight: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
          ),
        ),
        actions: const [ 
          Padding(
            padding: EdgeInsets.only(right: 8, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: FaIcon(
                        FontAwesomeIcons.solidHeart,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: FaIcon(
                        FontAwesomeIcons.solidHeart,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: FaIcon(
                        FontAwesomeIcons.solidHeart,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: FaIcon(
                        FontAwesomeIcons.solidHeart,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: FaIcon(
                        FontAwesomeIcons.solidHeart,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: FaIcon(
                        FontAwesomeIcons.chartSimple,
                        size: 30,
                        color: Colors.yellow,
                      ),
                    ),
                    Text('10 coins'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      body: presenter.selectPage(selectedItem),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedItem,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_task),
            label: 'rewards',
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
