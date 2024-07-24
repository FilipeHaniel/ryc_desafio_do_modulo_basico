import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ryc_desafio_do_modulo_basico/presentation/presenter/main_presenter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedItem = 0;

  late MainPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = MainPresenter();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => presenter,
      child: Scaffold(
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<MainPresenter, int>(
                    builder: (context, state) {
                      return Stack(
                        children: [
                          Row(
                            children: presenter.greyHeart.map((heart) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: heart,
                              );
                            }).toList(),
                          ),
                          Row(
                            children: presenter.redHeart.map((heart) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: heart,
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    },
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: FaIcon(
                          FontAwesomeIcons.chartSimple,
                          size: 30,
                          color: Colors.yellow,
                        ),
                      ),
                      BlocBuilder<MainPresenter, int>(
                        builder: (context, coin) {
                          return Text('$coin');
                        },
                      ),
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
      ),
    );
  }
}
