import 'package:flutter/material.dart';
import 'package:test/core/models/feedModel.dart';
import 'package:test/screens/home/widgets/descArea.dart';
import 'package:test/screens/home/widgets/saveFeed.dart';

import '../../../main.dart';

class FeedWidget extends StatelessWidget {
  final String channelName;
  final String imageurl;
  final String description;
  final bool isMoreNeeded;
  final String subtitle;
  final bool isBookmarked;
  final FeedModel feedData;

  FeedWidget(
      {required this.channelName,
      required this.description,
      required this.feedData,
      required this.isBookmarked,
      required this.isMoreNeeded,
      required this.subtitle,
      required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipOval(
                        child: Image.network(
                          imageurl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(channelName),
                  ],
                ),
                Icon(Icons.more_vert)
              ],
            ),
          ),
          Container(
            height: 350,
            child: Container(
                // width: double.infinity,
                child: Image.network(
              imageurl,
              fit: BoxFit.cover,
            )),
          ),

          //* bookmak
          BookMarkSection(
            bookmarkcheck: isBookmarked,
            feedData: feedData,
          ),
          const SizedBox(
            height: 10,
          ),
          //*title sec
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Container(
                  width: 70,
                  child: Stack(
                    children: [
                      customcircleWidget(),
                      Positioned(left: 20, child: customcircleWidget()),
                      Positioned(left: 40, child: customcircleWidget()),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                RichText(
                  text: TextSpan(
                      text: "Liked by",
                      style: TextStyle(color: black),
                      children: [
                        TextSpan(
                            text: " arun",
                            style: TextStyle(
                                color: black, fontWeight: FontWeight.w900)),
                        TextSpan(text: " and "),
                        TextSpan(
                            text: " 6707 others",
                            style: TextStyle(
                                color: black, fontWeight: FontWeight.w900)),
                      ]),
                )
              ],
            ),
          ),
          //* dsc sec
          DescriptionArea(
            isMore: isMoreNeeded,
            channelname: channelName,
            dscription: description,
            subtitile: subtitle,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "View all 931 comments",
              style: TextStyle(color: Colors.black38),
            ),
          )
        ],
      ),
    );
  }
}

class customcircleWidget extends StatelessWidget {
  const customcircleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: ClipOval(
        child: Image.asset(
          "assets/images/1.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
