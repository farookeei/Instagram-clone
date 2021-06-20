import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/core/provider/commentsProvider.dart';
import 'package:test/core/provider/feedProvider.dart';
import 'package:test/core/services/dependecyInjection.dart';
import 'package:test/screens/commensScren.dart/commentsScreen.dart';
import 'package:test/screens/home/homeScreen.dart';
import 'package:test/screens/saved/Saved.dart';

import 'core/database/database_config.dart';
import 'core/env/env_configs.dart';

void main() async {
  envConfig();
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocators();
  await hiveInitalSetup();
  runApp(MyApp());
}

Color black = Colors.black;
Color red = Colors.red;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FeedProvider()),
        ChangeNotifierProvider(create: (_) => CommntProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {
          Saved.routeName: (ctx) => Saved(),
          CommentsScren.routeName: (ctx) => CommentsScren()
        },
      ),
    );
  }
}
