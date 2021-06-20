import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_Provider;
import 'package:test/core/database/feedDatabase.dart';
import 'package:test/core/models/feedModel.dart';

hiveInitalSetup() async {
  final appDocumnetDirectory =
      await path_Provider.getApplicationDocumentsDirectory();

  Hive.registerAdapter(FeedModelAdapter());

  Hive.init(appDocumnetDirectory.path);

  await Hive.openBox(Feeddatabase.boxname);
}
