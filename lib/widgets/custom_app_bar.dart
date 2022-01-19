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
      child: const Responsive(
        mobile: _CustomAppBarMobile(),
        desktop: _CustomAppBarDesktop(),
        tablet: _CustomAppBarMobile(),
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  const _CustomAppBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  const _CustomAppBarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Row(
              children: [
                _AppBarButton(
                  onTap: () => showToast(context: context, title: "Home"),
                  title: "Home",
                ),
                _AppBarButton(
                  onTap: () => showToast(context: context, title: "TV Shows"),
                  title: "TV Show",
                ),
                _AppBarButton(
                  onTap: () => showToast(context: context, title: "Movies"),
                  title: "Movies",
                ),
                _AppBarButton(
                  onTap: () => showToast(context: context, title: "Latest"),
                  title: "Latest",
                ),
                _AppBarButton(
                  onTap: () => showToast(context: context, title: "MyList"),
                  title: "My List",
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              children: [
                IconButton(
                  color: Colors.white,
                  onPressed: () => showToast(context: context, title: "Search"),
                  icon: const Icon(
                    Icons.search,
                    size: 28.0,
                  ),
                ),
                _AppBarButton(
                  onTap: () => showToast(context: context, title: "KIDS"),
                  title: "KIDS",
                ),
                _AppBarButton(
                  onTap: () => showToast(context: context, title: "DVD"),
                  title: "DVD",
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () => showToast(context: context, title: "Gift"),
                  icon: const Icon(
                    Icons.card_giftcard,
                    size: 28.0,
                  ),
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () =>
                      showToast(context: context, title: "Notifications"),
                  icon: const Icon(
                    Icons.notifications,
                    size: 28.0,
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          )
        ],
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
