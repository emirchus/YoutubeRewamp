import 'package:flutter/material.dart';
import 'package:youtube_challenge/widgets/colors.dart';
import 'package:youtube_challenge/widgets/licons.dart';


class Navbar extends StatelessWidget {

  final int currentIndex;
  final Function(int)? onChange;

  const Navbar({Key? key, required this.currentIndex, required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          elevation: 0,
          color: YColors.navColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavButton(
                icon: LIcons.home_alt,
                isActive: currentIndex == 0,
                onTap: () {},
              ),
              NavButton(
                icon: LIcons.apps,
                isActive: currentIndex == 1,
                onTap: () {},
              ),
              SizedBox(width: 30,),
              NavButton(
                icon: LIcons.compass,
                isActive: currentIndex == 2,
                onTap: () {},
              ),
              GestureDetector(
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/profile.png"))
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {

  final IconData icon;
  final Function() onTap;
  final bool isActive;

  const NavButton({ Key? key, required this.icon, required this.onTap, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: this.onTap,
      icon: Icon(this.icon, color: this.isActive ? YColors.iconAColor : YColors.iconDColor,)
    );
  }
}