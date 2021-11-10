import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news_app/data/providers/theme_provider.dart';
import 'package:news_app/screens/home/home_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'data/providers/news_provider.dart';

void main() async {
  final box = await _openCacheBox();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NewsProvider(box: box)..getNews(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: Provider.of<ThemeProvider>(context).currentThemeData,
      home: const HomeScreen(),
    );
  }
}

Future<Box> _openCacheBox() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  final cachedBoxData = await Hive.openBox('cachedResponses');
  return cachedBoxData;
}
