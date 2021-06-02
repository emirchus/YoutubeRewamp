import 'package:flutter/material.dart';
import 'package:youtube_challenge/widgets/colors.dart';
class YAppbar extends StatelessWidget {

  const YAppbar({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      expandedHeight: 30,
      backgroundColor: YColors.canvas,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Image.asset("assets/youtube.png", height: 18,),
      ),
    );
  }
}