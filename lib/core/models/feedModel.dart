import 'package:hive/hive.dart';

part 'feedModel.g.dart';

@HiveType(typeId: 1)
class FeedModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String channelName;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String highhumb;
  // @HiveField(4)
  // final NetworkImage lowhumb;
  @HiveField(4)
  final bool isMoreneeded;
  @HiveField(5)
  final String subtitle;
  // @HiveField(0)
  // final NetworkImage mediumhumb;
  @HiveField(6)
  bool isbookMarked;

  FeedModel(
      {required this.channelName,
      required this.highhumb,
      required this.id,
      // required this.lowhumb,
      // required this.mediumhumb,
      required this.subtitle,
      this.isMoreneeded = false,
      this.isbookMarked = false,
      required this.title});

  static FeedModel convert(Map data) {
    bool isMore = true;
    String subtitle = ''; //used for showing empty space

    return FeedModel(
        channelName: data["channelname"],
        highhumb: data["high thumbnail"],
        id: data["id"],
        // lowhumb: data["low thumbnail"],
        // mediumhumb: data["medium thumbnail"],
        isMoreneeded: isMore,
        subtitle: subtitle,
        title: data["title"]);
  }
}
