import 'package:flutter/material.dart';
import 'package:youtube_challenge/widgets/colors.dart';

class TitleSection extends StatelessWidget {

  final String title;
  final IconData? icon;
  final Function()? onTap;

  const TitleSection({Key? key, required this.title, this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(this.title, style: TextStyle(color: YColors.textColor, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.left,),
            if(icon != null) IconButton(onPressed: this.onTap, icon: Icon(this.icon, color: Colors.white54,))
          ],
        ),
      ),
    );
  }
}


