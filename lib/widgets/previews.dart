import 'package:flutter/material.dart';
import 'package:flutter_net_clone/models/content_model.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  const Previews({Key? key, required this.title, required this.contentList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 165.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            itemCount: contentList.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = contentList[index];
              return _ItemCard(content: content);
            },
          ),
        )
      ],
    );
  }
}

class _ItemCard extends StatelessWidget {
  const _ItemCard({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Content content;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print(content.name),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            height: 130.0,
            width: 130.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(content.imageUrl),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
              border: Border.all(color: content.color, width: 4.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            height: 130.0,
            width: 130.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.black45, Colors.transparent],
                stops: [0, 0.25, 1],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 60.0,
              child: Image.asset(content.titleImageUrl),
            ),
          )
        ],
      ),
    );
  }
}
