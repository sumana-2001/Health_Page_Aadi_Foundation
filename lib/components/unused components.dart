import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

class gbar extends StatefulWidget {
  const gbar({super.key});

  @override
  State<gbar> createState() => _gbarState();
}

class _gbarState extends State<gbar> {
  @override
  Widget build(BuildContext context) {
    int _select=0;
    double screenWidth = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.transparent,
      child:
      ClipPath(
        clipper: ProsteBezierCurve(
          position: ClipPosition.top,
          list: [
            BezierCurveSection(
              start: Offset(screenWidth, 20),
              top: Offset(screenWidth / 2, 0),
              end: Offset(0, 20),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          color: Colors.white,
          height: 110,
          child: GNav(
            gap: 8,
            haptic: true,
            color: Colors.grey,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.lightBlueAccent.shade100,
            padding: EdgeInsets.all(15),
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: "Home",
              ),
              GButton(
                icon: Icons.stacked_bar_chart_outlined,
                text: "Stats",
              ),
              GButton(
                icon: Icons.shopping_bag_outlined,
                text: "Shop",
              ),
              GButton(
                icon: Icons.person,
                text: "Profile",
              ),
            ],
            onTabChange: (index){
              _select=index;
            },
          ),
        ),
      ),
    );
  }
}
