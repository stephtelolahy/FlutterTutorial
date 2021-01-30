import 'package:flutter/material.dart';
import 'package:flutter_app/firstapp.dart';
import 'package:flutter_app/interactivity.dart';
import 'package:flutter_app/layouts.dart';
import 'package:flutter_app/namedroutes.dart';
import 'package:flutter_app/tapboxb.dart';
import 'package:flutter_app/widgets.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter layout demo',
    // home: LayoutDemo(),
    // home: WidgetsDemo(),
    // home: RandomWords(),
    // home: InteractivityDemo(),
    // home: ParentWidget()
    home: Nav2App()
  ));
}
