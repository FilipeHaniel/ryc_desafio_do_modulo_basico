import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.network(
                      'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngegg.com%2Fes%2Fpng-veqkc&psig=AOvVaw1PAPJc9zVUrz3hMqKRxJhv&ust=1719280332186000&source=images&cd=vfe&opi=89978449&ved=0CA8QjRxqFwoTCKjQjcyQ84YDFQAAAAAdAAAAABAJ'),
                ),
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Elixir'),
                      Text('Restaura um ponto de vida'),
                    ],
                  ),
                ),
                const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: FaIcon(
                        FontAwesomeIcons.cartFlatbed,
                        size: 50,
                        color: Colors.blue,
                      ),
                    ),
                    Text('5 coins'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
