import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ryc_desafio_do_modulo_basico/presentation/view/pages/home_page.dart';
import 'package:ryc_desafio_do_modulo_basico/presentation/view/pages/rewards_page.dart';

class MainPresenter extends Cubit<int> {
  MainPresenter() : super(10);

  void incrementCoin() {
    emit(state + 5);
  }

  void decrementCoin() {
    emit(state - 5);
  }

  List<Widget> greyHeart = List.generate(
    5,
    (index) => const FaIcon(
      FontAwesomeIcons.solidHeart,
      size: 30,
      color: Colors.grey,
    ),
  );

  List<Widget> redHeart = List.generate(
    5,
    (index) => const FaIcon(
      FontAwesomeIcons.solidHeart,
      size: 30,
      color: Colors.red,
    ),
  );

  void removeRedHeart() {
    if (redHeart.isNotEmpty) {
      redHeart.removeLast();
      emit(state);
    }
  }

  void addRedHeartIfPossible() {
    if (state >= 5 && redHeart.length < 5) {
      redHeart.add(const FaIcon(
        FontAwesomeIcons.solidHeart,
        size: 30,
        color: Colors.red,
      ));
      decrementCoin();
      emit(state);
    }
  }

  final List<Widget> _appScreen = [
    const HomePage(),
    const RewardsPage(),
  ];

  Widget selectPage(int index) {
    switch (index) {
      case 0:
        return _appScreen[0];
      case 1:
        return _appScreen[1];
      default:
        return Container();
    }
  }
}
