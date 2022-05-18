import 'package:flutter/material.dart';

import 'modules/home/view/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muvi',
      home: HomePage(),
    );
  }
}