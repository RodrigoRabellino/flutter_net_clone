import 'package:flutter/material.dart';
import 'package:flutter_net_clone/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color: Colors.red,
      child: Row(
        children: [Image.asset(Assets.netflixLogo0)],
      ),
    );
  }
}
