// for any base api configs  i used in the suystem

abstract class BaseAPIConfig {
  Future<List> getAPI({String? authorization, required String url});

  Future<Map> postAPI({
    Map<String, String>? addOnHeader,
    Map<String, dynamic>? body,
    required String url,
    String? authorization,
  });

  Future<Map> patchAPI({
    Map<String, String>? addOnHeader,
    Map<String, dynamic>? body,
    String? authorization,
    required String url,
  });

  Future<Map> putAPI({
    Map<String, String>? addOnHeader,
    Map<String, dynamic>? body,
    String? authorization,
    required String url,
    int? id,
  });

  Future<Map> deleteAPI({
    Map<String, String>? addOnHeader,
    Map<String, dynamic>? body,
    required String url,
    int? id,
    String? authorization,
  });
}
