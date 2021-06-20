import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/core/provider/feedProvider.dart';
import 'package:test/screens/home/widgets/feedWidget.dart';
import 'package:test/widgets/appbar.dart';

class Saved extends StatefulWidget {
  static const routeName = "saved";

  @override
  _SavedState createState() => _SavedState();
}

// @override
// void didChangeDependencies() {
//   if(count =1){

//   }
//   super.didChangeDependencies();

// }

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Saved')),
      body: Consumer<FeedProvider>(
        builder: (ctx, _feedPro, _) => _feedPro.feedData.isEmpty
            ? Center(
                child: Text('Nothing Saved',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .merge(TextStyle(color: black))))
            : ListView.builder(
                itemCount: _feedPro.bookmarkedData.length,
                itemBuilder: (ctx, index) {
                  var _feedData = _feedPro.bookmarkedData[index];

                  return FeedWidget(
                    channelName: _feedData.channelName,
                    imageurl: _feedData.highhumb,
                    description: _feedData.title,
                    isMoreNeeded: _feedData.isMoreneeded,
                    subtitle: _feedData.subtitle,
                    isBookmarked: _feedData.isbookMarked,
                    feedData: _feedData,
                  );
                },
              ),
      ),
    );
  }
}
