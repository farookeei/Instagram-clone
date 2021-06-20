import 'package:hive/hive.dart';
import 'package:test/core/models/feedModel.dart';

class Feeddatabase {
  static const String boxname = 'feedBox';

  Future<void> addData(FeedModel feedData) async {
    final _feedBox = Hive.box(boxname);

    await _feedBox.add(feedData);
  }

  List<FeedModel> fechData() {
    final _feedBox = Hive.box(boxname);

    List<FeedModel> _feedData = [];

    if (_feedBox.isEmpty) return [];

    for (var i = 0; i < _feedBox.length; i++) _feedData.add(_feedBox.getAt(i));

    return _feedData;
  }

  Future<void> deleteData(FeedModel feedModels) async {
    final _feedBox = Hive.box(boxname);

    if (_feedBox.isEmpty) return null;

    for (var i = 0; i < _feedBox.length; i++) {
      final data = _feedBox.getAt(i);

      if (data.id == feedModels.id) {
        await _feedBox.deleteAt(i);
      }
    }
  }
}
