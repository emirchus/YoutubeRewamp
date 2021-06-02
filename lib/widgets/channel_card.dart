import 'package:flutter/material.dart';
import 'package:youtube_challenge/extensions/stringExtensions.dart';
import 'package:youtube_challenge/models/creator_model.dart';
import 'package:youtube_challenge/widgets/colors.dart';


class ChannelCard extends StatelessWidget {
  const ChannelCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  final CreatorModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 100,
            height: 100,
            child: CircleAvatar(
              backgroundImage: AssetImage(model.picture),
            ),
          ),
          Text(model.username, style: TextStyle(color: YColors.textColor, fontWeight: FontWeight.bold), softWrap: false, overflow: TextOverflow.fade, textAlign: TextAlign.center,),
          Text("${model.subscribers.toString().formatter()} suscriptores", style: TextStyle(color: YColors.textColor.withOpacity(.7)), softWrap: true, textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}