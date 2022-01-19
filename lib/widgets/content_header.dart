import 'package:flutter/material.dart';
import 'package:flutter_net_clone/models/models.dart';
import 'package:flutter_net_clone/widgets/widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  const ContentHeader({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featuredContent.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250.0,
            child: Image.asset(featuredContent.titleImageUrl),
          ),
        ),
        Positioned(
          bottom: 40.0,
          left: 0,
          right: 0,
          child: Row(
            children: [
              VerticalIconButton(
                icon: Icons.add,
                title: "List",
                onTap: () => showToast(
                    context: context,
                    title: "Added to List " + featuredContent.name),
              ),
              _PlayButton(
                title: featuredContent.name.toString(),
              ),
              VerticalIconButton(
                icon: Icons.info_outline,
                title: "Info",
                onTap: () => showToast(
                    context: context, title: "Info: " + featuredContent.name),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  final String title;
  const _PlayButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showToast(context: context, title: "Play " + title),
      style: ElevatedButton.styleFrom(
          primary: Colors.white,
          padding: const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0)),
      child: Row(
        children: const [
          Icon(
            Icons.play_arrow,
            size: 30.0,
            color: Colors.black,
          ),
          Text(
            "Play",
            style: TextStyle(
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
