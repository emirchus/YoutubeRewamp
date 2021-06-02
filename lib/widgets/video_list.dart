import 'package:flutter/material.dart';
import 'package:youtube_challenge/models/video_model.dart';
import 'package:youtube_challenge/widgets/video_card.dart';

class VideoList extends StatelessWidget {
  final List<VideoModel> list;
  const VideoList({
    Key? key,
    required this.list
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 16/9,
        child: ListView.builder(
          itemCount: this.list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index){
            VideoModel model = this.list[index];

            final double _width = MediaQuery.of(context).size.width ;
            final double _height = _width * 9 / 16;

            final DateTime upload = DateTime.fromMicrosecondsSinceEpoch(model.uploadDate);

            return VideoCard(model: model, width: _width, height: _height, upload: upload);
          },
        ),
      ),
    );
  }
}
