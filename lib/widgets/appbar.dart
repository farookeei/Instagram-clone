import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color black = Colors.black;
Color red = Colors.red;
PreferredSize appbar(BuildContext context) {
  return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: AppBar(
        actions: [
          Container(
              margin: const EdgeInsets.only(top: 10, right: 12),
              child: Stack(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    child: SvgPicture.asset(
                      "assets/images/Share.svg",
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(1.5),
                      decoration: BoxDecoration(
                          color: red, borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        "10",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  )
                ],
              ))
        ],
        backgroundColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.only(top: 10, left: 9),
          child: FaIcon(
            FontAwesomeIcons.instagram,
            color: black,
          ),
        ),
        title: Text(
          "Instagram",
          style: Theme.of(context).primaryTextTheme.headline4!.merge(TextStyle(
                color: black,
                fontFamily: "Billabong",
                fontWeight: FontWeight.w600,
              )),
        ),
      ));
}
