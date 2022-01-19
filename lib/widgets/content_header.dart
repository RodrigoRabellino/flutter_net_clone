import 'package:flutter/material.dart';
import 'package:flutter_net_clone/models/models.dart';
import 'package:flutter_net_clone/widgets/widgets.dart';
import 'package:video_player/video_player.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  const ContentHeader({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _MobileHeader(
        featuredContent: featuredContent,
      ),
      tablet: _MobileHeader(
        featuredContent: featuredContent,
      ),
      desktop: _DesktopHeader(
        featuredContent: featuredContent,
      ),
    );
  }
}

class _MobileHeader extends StatelessWidget {
  final Content featuredContent;
  const _MobileHeader({Key? key, required this.featuredContent})
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

class _DesktopHeader extends StatefulWidget {
  final Content featuredContent;

  const _DesktopHeader({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  State<_DesktopHeader> createState() => _DesktopHeaderState();
}

class _DesktopHeaderState extends State<_DesktopHeader> {
  VideoPlayerController _videoController = VideoPlayerController.network("");
  bool _isMuted = false;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.network(widget.featuredContent.videoUrl)
          ..initialize().then((_) => setState(() {}))
          ..play();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoController.value.isPlaying
          ? _videoController.pause()
          : _videoController.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: _videoController.value.isInitialized
                ? _videoController.value.aspectRatio
                : 2.344,
            child: _videoController.value.isInitialized
                ? VideoPlayer(_videoController)
                : Image.asset(
                    widget.featuredContent.imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -1.0,
            child: AspectRatio(
              aspectRatio: _videoController.value.isInitialized
                  ? _videoController.value.aspectRatio
                  : 2.344,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 60.0,
            left: 60.0,
            bottom: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250.0,
                  child: Image.asset(
                    widget.featuredContent.titleImageUrl,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  widget.featuredContent.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(2.0, 4.0),
                          blurRadius: 6.0),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const _PlayButton(title: "Play"),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () =>
                          showToast(context: context, title: "info"),
                      icon: const Icon(Icons.info_outline),
                      tooltip: "More Info",
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    if (_videoController.value.isInitialized)
                      IconButton(
                          color: Colors.white,
                          icon: Icon(_isMuted
                              ? Icons.volume_off_rounded
                              : Icons.volume_up_rounded),
                          onPressed: () => setState(() {
                                _isMuted
                                    ? _videoController.setVolume(100)
                                    : _videoController.setVolume(0);
                                _isMuted = _videoController.value.volume == 0;
                              }),
                          tooltip: _isMuted ? "Volumen" : "Mute"),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
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
