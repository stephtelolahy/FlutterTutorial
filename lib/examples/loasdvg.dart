import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SVG Demo',
        home: Scaffold(
          appBar: AppBar(
            title: Text("Load SVG"),
          ),
          body: Center(
            child: SvgPicture.asset(
              'images/user.svg',
              color: Colors.cyan,
            ),
          ),
        ));
  }
}
