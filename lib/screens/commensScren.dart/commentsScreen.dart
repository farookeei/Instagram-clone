import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/core/provider/commentsProvider.dart';
import 'package:test/widgets/notification.dart';

class CommentsScren extends StatefulWidget {
  static const routeName = "/comments";

  @override
  _CommentsScrenState createState() => _CommentsScrenState();
}

bool isLoading = false;
int count = 1;
GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _CommentsScrenState extends State<CommentsScren> {
  void fetchCommnts(BuildContext context) {
    try {
      setState(() {
        isLoading = true;
      });
      Provider.of<CommntProvider>(context, listen: false)
          .fetchCommentsFromServers();

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      snackbar(context, e.toString());
    }
  }

  @override
  void didChangeDependencies() {
    if (count == 1) {
      fetchCommnts(context);
      count = 2;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Comment Section"),
      ),
      body: Consumer<CommntProvider>(
        builder: (ctx, commProv, _) {
          return ListView.builder(
              itemCount: commProv.commentsData.length,
              itemBuilder: (ctx, i) {
                return isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ListTile(
                        // leading: Text(commProv.commentsData[i].comments),
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/1.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                            " ${commProv.commentsData[i].comments} - ${commProv.commentsData[i].name}"),
                        trailing: Icon(Icons.favorite_border),
                      );
              });
        },
      ),
    );
  }
}
