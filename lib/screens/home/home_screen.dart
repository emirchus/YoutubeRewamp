import 'package:flutter/material.dart';
import 'package:youtube_challenge/constants/youtube_data.dart';
import 'package:youtube_challenge/widgets/appbar.dart';
import 'package:youtube_challenge/widgets/channels_list.dart';
import 'package:youtube_challenge/widgets/colors.dart';
import 'package:youtube_challenge/widgets/licons.dart';
import 'package:youtube_challenge/widgets/navbar.dart';
import 'package:youtube_challenge/widgets/title_section.dart';
import 'package:youtube_challenge/widgets/video_list.dart';


class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: CustomScrollView(
        slivers: [
          YAppbar(),
          TitleSection(title: "Tu música para la tarde", icon: LIcons.search, onTap: () {},),
          VideoList(
            list: YoutubeData.getVideos.sublist(0, (YoutubeData.getVideos.length / 2).round()),
          ),
          TitleSection(title: "Tus favoritos",),
          ChannelsList(),
          TitleSection(title: "En tendecia",),
          VideoList(
            list: YoutubeData.getVideos.sublist((YoutubeData.getVideos.length / 2).round())
          ),
          TitleSection(title: "Tus suscripciones", icon: LIcons.search, onTap: () {},),
          ChannelsList(),
          /** Espaci XD */
          SliverToBoxAdapter(
            child: Container(
              height: 120,
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 77.0,
        width: 77.0,
        child: FittedBox(
          child:  FloatingActionButton(
            onPressed: () {},
            elevation: 0,
            backgroundColor: YColors.navColor,
            child: Icon(LIcons.video, size: 34, color: YColors.iconAColor,),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Navbar(currentIndex: 0, onChange: (index) {}),
    );
  }
}
