import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:youtube_challenge/constants/youtube_data.dart';
import 'package:youtube_challenge/extensions/stringExtensions.dart';
import 'package:youtube_challenge/models/creator_model.dart';
import 'package:youtube_challenge/models/video_model.dart';
import 'package:youtube_challenge/widgets/Video_card.dart';
import 'package:youtube_challenge/widgets/colors.dart';
import 'package:youtube_challenge/widgets/licons.dart';


class VideoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    VideoModel? model = ModalRoute.of(context)!.settings.arguments as VideoModel?;

    final size = MediaQuery.of(context).size;
    final _width = size.width;
    final _height = _width * 9 / 16;

    final DateTime upload = DateTime.fromMicrosecondsSinceEpoch(model!.uploadDate);
    final List<VideoModel> videos = YoutubeData.getVideos.where((video) => video.id != model.id).toList();
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: _width,
              height: _height,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Hero(
                      tag: "preview-${model.id}",
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(image: AssetImage(model.preview))
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: _width / 2.0,
                                child: Text(model.title, textAlign: TextAlign.left, softWrap: false, overflow: TextOverflow.fade, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, shadows: [
                                   Shadow(
                                   offset: Offset(0.0, 4.0),
                                    blurRadius: 6.0,
                                    color: Colors.black.withOpacity(0.1),
                                  ),
                                ])),
                              ),
                              Text("${model.views.toString().formatter()} ● Hace ${upload.difference(DateTime.now()).inSeconds.abs()} días", textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 12)),
                            ],
                          ),
                          IconButton(onPressed: (){}, icon: Icon(LIcons.repeat))
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: _width / 2,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.8),
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(child: Image.asset(model.preview, fit: BoxFit.cover,)),
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 100.0,
                        sigmaY: 100.0,
                      ),
                      child: Container(
                        color: Colors.black.withOpacity(.6),
                        child: ListView(
                          padding: const EdgeInsets.only(bottom: 20),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: AuthorChip(model: model.author)
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        StadisticButton(color: Colors.green, icon: LIcons.thumbs_up),
                                        StadisticButton(color: Colors.red, icon: LIcons.thumbs_down),
                                        VideoButton(icon: LIcons.share,),
                                        VideoButton(icon: LIcons.download_alt,),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Comentarios (${model.comments.length * Random().nextInt(1400)})", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundImage: AssetImage(model.comments.first.picture),
                                      ),
                                      SizedBox(width: 10,),
                                      Text(model.comments.first.comment, style: TextStyle(color: Colors.white))
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30),
                              child: Text("Videos Similares", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                            ),
                            AspectRatio(
                              aspectRatio: 16/9,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: videos.sublist(0, (videos.length / 2).round()).length,
                                itemBuilder: (_, index){
                                  VideoModel video = videos.sublist(0, (videos.length / 2).round())[index];

                                  return VideoCard(model: video, width: _width, height: _height, upload: upload, onTap: () => Navigator.pushReplacementNamed(context, "/video", arguments: video),);
                                },

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40, bottom: 10, left: 30),
                              child: Text("En tendencia que podría gustarte", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                            ),
                            AspectRatio(
                              aspectRatio: 16/9,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: videos.sublist((videos.length / 2).round()).length,
                                itemBuilder: (_, index){
                                  VideoModel video = videos.sublist((videos.length / 2).round())[index];

                                  return VideoCard(model: video, width: _width, height: _height, upload: upload, onTap: () => Navigator.pushReplacementNamed(context, "/video", arguments: video),);
                                },

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}

class VideoButton extends StatelessWidget {
  final IconData icon;

  const VideoButton({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: YColors.navColor,
          shape: BoxShape.circle
        ),
        child: Icon(this.icon, size: 14,),
      ),
    );
  }
}

class StadisticButton extends StatelessWidget {

  double size = 40;

  final Color color;
  final IconData icon;

  StadisticButton({Key? key, required this.color, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Opacity(
        opacity: .8,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: YColors.navColor,
            shape: BoxShape.circle
          ),
          child: Stack(
            children: [
              ShaderMask(shaderCallback: (rect) => SweepGradient(
                  startAngle: 0.0,
                  endAngle: 3.14 * 2,
                  center: Alignment.center,
                  stops: [.7, .6],
                  colors: [this.color, Colors.transparent]
                ).createShader(rect),
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: this.color,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: size - 5,
                  height: size - 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: YColors.navColor
                  ),
                  child: Center(
                    child: Icon(this.icon, size: 14,),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AuthorChip extends StatelessWidget {

  const AuthorChip({ Key? key, required this.model,}) : super(key: key);

  final CreatorModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(model.picture),
        ),
        SizedBox(width: 10,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: (MediaQuery.of(context).size.width / 3) - 10,
              child: Text(model.username, softWrap: false, overflow: TextOverflow.fade, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
            ),
            Text("SUSCRIBIRSE", style: TextStyle(color: YColors.red, fontWeight: FontWeight.bold),)
          ],
        )
      ],
    );
  }
}