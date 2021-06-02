import 'package:flutter/material.dart';
import 'package:youtube_challenge/extensions/stringExtensions.dart';
import 'package:youtube_challenge/models/video_model.dart';
import 'package:youtube_challenge/widgets/colors.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    Key? key,
    required this.model,
    required double width,
    required double height,
    required this.upload,
    this.onTap
  }) : _width = width, _height = height, super(key: key);

  final VideoModel model;
  final double _width;
  final double _height;
  final DateTime upload;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => this.onTap == null ?  Navigator.pushNamed(context, "/video", arguments: model) : this.onTap!(),
      child: Container(
        width: _width,
        height: _height,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(model.preview), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.5),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Text(model.duration, style: TextStyle(color: YColors.textColor, fontSize: 10, fontWeight: FontWeight.bold),),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: CircleAvatar(
                backgroundImage: AssetImage(model.author.picture),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(model.title, textAlign: TextAlign.right, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), softWrap: false, overflow: TextOverflow.ellipsis,),
                    Text("${model.views.toString().formatter()} ● Hace ${upload.difference(DateTime.now()).inSeconds.abs()} días", style: TextStyle(color: Colors.white, fontSize: 12)),
                    Text("${model.author.username}", style: TextStyle(color: Colors.white, fontSize: 12))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

