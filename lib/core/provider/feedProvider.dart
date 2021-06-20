import 'package:flutter/foundation.dart';
import 'package:test/core/database/feedDatabase.dart';
import 'package:test/core/models/feedModel.dart';
import 'package:test/core/services/dependecyInjection.dart';
import 'package:test/core/services/dio_serices_API.dart';

class FeedProvider with ChangeNotifier {
  DioServicesAPI _dioServicesAPI = locator<DioServicesAPI>();
  Feeddatabase _feedDatabase = locator<Feeddatabase>();
  FeedModel? _feedModel;
  List<FeedModel> _feedData = [];
  List<FeedModel> _bookmarkedData = [];

  //?getter
  List<FeedModel> get feedData => [..._feedData];
  List<FeedModel> get bookmarkedData => [..._bookmarkedData];

  Future<void> fetchDetails() async {
    try {
      _feedData = [];

      //TODO url error check
      final _fetchData = await _dioServicesAPI.getAPI(
          url:
              "videos_api/cdn/com.rstream.crafts?versionCode=40&lurl=Canvas%20painting%20ideas");

      for (var _temp in _fetchData) {
        FeedModel _tempData = FeedModel.convert(_temp);

        //?check whether empty
        if (_bookmarkedData
            .where((e) => e.id == _tempData.id)
            .toList()
            .isNotEmpty) {
          _tempData.isbookMarked = true;
        }
        _feedData.add(_tempData);
      }

      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> saveFeed(FeedModel feedData) async {
    if (_bookmarkedData
        .where((element) => element.id == feedData.id)
        .toList()
        .isEmpty) {
      _bookmarkedData.add(feedData);
      for (var i = 0; i < _feedData.length; i++) {
        if (_feedData[i].id == feedData.id) {
          _feedData[i].isbookMarked = true;
        }
      }
      await _feedDatabase.addData(feedData);
      notifyListeners();
      print("adde");
    }
  }

  Future<void> removeSaved(FeedModel feedDatas) async {
    _bookmarkedData.removeWhere((element) => element.id == feedDatas.id);

    for (var i = 0; i < _feedData.length; i++) {
      if (_feedData[i].id == feedDatas.id) {
        _feedData[i].isbookMarked = false;
      }
    }

    await _feedDatabase.deleteData(feedDatas);
    notifyListeners();
    print("object");
  }

  void acessData() {
    _bookmarkedData = _feedDatabase.fechData();
  }
}
