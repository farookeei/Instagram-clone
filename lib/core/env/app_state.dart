import 'dart:developer';

enum AppStateType { dev, production }

class ServerState {
  //!post
  static const productionServers = 'https://hiit.ria.rocks/';
  static const testingServers = 'https://hiit.ria.rocks/';
}

//!comments
class CommentsServer {
  static const productionServers = 'http://cookbookrecipes.in/';
  static const testingServers = 'http://cookbookrecipes.in/';
}

class APPState {
  static AppStateType appState = AppStateType.production;
}

class StateHandler {
  static String serversType = ServerState.productionServers;
  static String commentsserver = CommentsServer.productionServers;

  String arg;

  StateHandler(this.arg);

  void init() {
    if (arg == 'dev') {
      log('App is running of dev state');
      APPState.appState = AppStateType.dev;
    } else {
      log('App is running on production state');
    }
  }

  void servershandler() {
    if (arg == 'dev') {
      serversType = ServerState.testingServers;
      commentsserver = CommentsServer.testingServers;
    }
  }

  static dynamic errorHandler(e) {
    return 'Error Occured';
  }
}
