import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ryc_desafio_do_modulo_basico/presentation/view/pages/home_page.dart';
import 'package:ryc_desafio_do_modulo_basico/presentation/view/pages/rewards_page.dart';

class MainPresenter extends Cubit {
  MainPresenter(super.initialState);

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
