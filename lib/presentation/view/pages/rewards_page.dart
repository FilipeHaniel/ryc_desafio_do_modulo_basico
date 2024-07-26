import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ryc_desafio_do_modulo_basico/presentation/presenter/main_presenter.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: Card(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset('assets/images/elixir.png'),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Elixir',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(color: Colors.black),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          Text(
                            'Restaura um ponto de vida',
                            style: GoogleFonts.quicksand(
                              textStyle:
                                  const TextStyle(color: Colors.grey),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: FaIcon(
                            FontAwesomeIcons.cartFlatbed,
                            size: 50,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          '5 coins',
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(color: Colors.grey),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      context.read<MainPresenter>().addRedHeartIfPossible();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
