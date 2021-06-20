import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:test/core/models/feedModel.dart';
import 'package:test/core/provider/feedProvider.dart';
import 'package:test/screens/commensScren.dart/commentsScreen.dart';

class BookMarkSection extends StatelessWidget {
  final bool bookmarkcheck;
  final FeedModel feedData; //? to save bookmark locally

  BookMarkSection({required this.bookmarkcheck, required this.feedData});

  void onPrssed(BuildContext context) {
    if (!bookmarkcheck) {
      Provider.of<FeedProvider>(context, listen: false).saveFeed(feedData);
      return;
    }
    Provider.of<FeedProvider>(context, listen: false).removeSaved(feedData);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.favorite_border),
              const SizedBox(
                width: 6,
              ),
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: () {
                  Navigator.pushNamed(context, CommentsScren.routeName);
                },
              ),
              const SizedBox(
                width: 6,
              ),
              Container(
                  height: 25,
                  width: 25,
                  child: SvgPicture.asset("assets/images/Share.svg")),
            ],
          ),
          IconButton(
              onPressed: () => onPrssed(context),
              icon: Icon(bookmarkcheck
                  ? Icons.bookmark
                  : Icons.bookmark_border_outlined)),
        ],
      ),
    );
  }
}
