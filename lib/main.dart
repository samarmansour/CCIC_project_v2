import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskes_project/bottom_nav.dart';
import 'package:taskes_project/home_Api/home_provider.dart';




void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create:(context)=>HomeProvider() )
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bottom_navigation()
    ),
    );
  }
}
