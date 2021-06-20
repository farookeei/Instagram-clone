import 'package:flutter/material.dart';
import 'package:test/core/models/commentsModel.dart';
import 'package:test/core/services/dependecyInjection.dart';
import 'package:test/core/services/dio_serices_API.dart';

class CommntProvider extends ChangeNotifier {
  DioServicesAPI _dioAPIServices = locator<DioServicesAPI>();

  List<CommentsModel> _commentData = [];
  List<CommentsModel> get commentsData => [..._commentData];

  Future<void> fetchCommentsFromServers() async {
    try {
      _commentData = [];

      final _fetchData = await _dioAPIServices.getAPI(
          url: 'http://cookbookrecipes.in/test.php');

      for (var item in _fetchData) {
        _commentData.add(CommentsModel.convert(item));
      }
      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
