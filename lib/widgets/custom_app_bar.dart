import 'package:flutter/material.dart';
import 'package:flutter_net_clone/assets.dart';
import 'package:flutter_net_clone/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffSet;
  const CustomAppBar({
    Key? key,
    this.scrollOffSet = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color: Colors.black.withOpacity((scrollOffSet / 350).clamp(0, 1)),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(Assets.netflixLogo0),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Row(
                children: [
                  _AppBarButton(
                    onTap: () => showToast(context: context, title: "TV Shows"),
                    title: "TV Show",
                  ),
                  _AppBarButton(
                    onTap: () => showToast(context: context, title: "Movies"),
                    title: "Movies",
                  ),
                  _AppBarButton(
                    onTap: () => showToast(context: context, title: "MyList"),
                    title: "My List",
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _AppBarButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600),
      ),
    );
  }
}
