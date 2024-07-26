import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
          toolbarHeight: 150,
          backgroundColor: Colors.deepPurple[400],
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: FaIcon(FontAwesomeIcons.user),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset('assets/images/icon_coin.png'),
                        ),
                        BlocBuilder<MainPresenter, int>(
                          builder: (context, coin) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                '$coin',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(color: Colors.white10),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: presenter.selectPage(selectedItem),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.deepPurple[400],
          fixedColor: Colors.white,
          unselectedItemColor: Colors.white70,
          currentIndex: selectedItem,
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.heart),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.pumpMedical),
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
