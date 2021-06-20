import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test/core/provider/feedProvider.dart';
import 'package:test/screens/saved/Saved.dart';
import 'package:test/widgets/appbar.dart';
import 'package:test/screens/home/widgets/feedWidget.dart';
import 'package:test/widgets/notification.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

int maxLines = 1;
int count = 1;
bool isLoading = false;

class _HomeScreenState extends State<HomeScreen> {
  Future<void> fetchData(BuildContext context) async {
    setState(() => isLoading = true);
    try {
      await Provider.of<FeedProvider>(context, listen: false).fetchDetails();
      setState(() => isLoading = false);
    } catch (e) {
      setState(() => isLoading = false);
      snackbar(context, e.toString());
      print(e);
    }
  }

  @override
  void didChangeDependencies() {
    if (count == 1) {
      fetchData(context);
      count = 2;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.book),
          onPressed: () {
            Navigator.pushNamed(context, Saved.routeName);
          },
        ),
        bottomNavigationBar: BootomNav(),
        appBar: appbar(context),
        body: Consumer<FeedProvider>(builder: (ctx, feedProv, _) {
          return isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: feedProv.feedData.length,
                  itemBuilder: (ctx, i) {
                    var feedData = feedProv.feedData[i];
                    return FeedWidget(
                      channelName: feedData.channelName,
                      description: feedData.title,
                      feedData: feedData,
                      isBookmarked: feedData.isbookMarked,
                      isMoreNeeded: feedData.isMoreneeded,
                      subtitle: feedData.subtitle,
                      imageurl: feedData.highhumb,
                    );
                  });
        }),
      ),
    );
  }
}

class BootomNav extends StatelessWidget {
  const BootomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border(top: BorderSide(color: Colors.grey))),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset("assets/images/Home.svg"),
          SvgPicture.asset("assets/images/Search.svg"),
          SvgPicture.asset("assets/images/add_icons.svg"),
          Icon(Icons.favorite_border),
          SvgPicture.asset("assets/images/Share.svg"),
        ],
      ),
    );
  }
}
