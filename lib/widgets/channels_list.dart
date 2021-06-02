import 'package:flutter/material.dart';
import 'package:youtube_challenge/constants/youtube_data.dart';
import 'package:youtube_challenge/models/creator_model.dart';
import 'package:youtube_challenge/widgets/channel_card.dart';


class ChannelsList extends StatelessWidget {
  const ChannelsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 150,
        child: ListView.builder(
          itemCount: YoutubeData.getCreators.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index){
            CreatorModel model = YoutubeData.getCreators[index];

            return ChannelCard(model: model);
          },
        ),
      ),
    );
  }
}