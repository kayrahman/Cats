
import 'package:flutter/material.dart';
import 'package:learning_dart/features/quran/presentation/pages/chapter_list_page.dart';


void main() {
  //MaterialApp(home: MyHomePage());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al Quran',
      theme: ThemeData(
       /* colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: true,*/
        primarySwatch: Colors.purple
      ),
      home: ChapterListPage()

      /*BlocProvider<AppCubits>(
        create: (context) => AppCubits(
          data: DataServices()
        ),
        child: AppCubitLogics() ,
      )*/

      //MainPage(),
    );
  }
}

