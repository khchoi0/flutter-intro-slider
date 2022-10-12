import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PageViewItem extends StatefulWidget {
  const PageViewItem(this.title, this.text, this.imgPath, this.vdoPath,
      {Key? key})
      : super(key: key);
  final String title, text, imgPath, vdoPath;

  @override
  State<PageViewItem> createState() => _PageViewItemState();
}

class _PageViewItemState extends State<PageViewItem> {
  late VideoPlayerController vdoController;

  @override
  void initState() {
    _loadVideoPlayer();
    super.initState();
  }

  _loadVideoPlayer() {
    vdoController = VideoPlayerController.asset(widget.vdoPath);
    vdoController.initialize().then(
          (value) {
        vdoController.setVolume(0);
        vdoController.setLooping(true);
        vdoController.play();
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    vdoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Material(
              color: Colors.transparent,
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 36,
                  fontFamily: "roboto_medium",
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.text.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Material(
                color: Colors.transparent,
                child: Text(
                  widget.text,
                  style: const TextStyle(
                      fontSize: 20,
                      fontFamily: "roboto_medium",
                      fontWeight: FontWeight.normal,
                      color: Colors.black45,
                      decoration: TextDecoration.none),
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.vdoPath.isNotEmpty,
          child: AspectRatio(
            // TODO: flutter sdk video_player bug to be fixed (https://github.com/flutter/flutter/issues/34642)
            // seems fixed on flutter repo master branch:
            // https://github.com/flutter/flutter/issues/34642#issuecomment-1217105666
            aspectRatio: vdoController.value.aspectRatio,
            child: VideoPlayer(vdoController),
          ),
        ),
        Visibility(
          visible: widget.vdoPath.isEmpty,
          child: Image.asset(
            widget.imgPath,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}


