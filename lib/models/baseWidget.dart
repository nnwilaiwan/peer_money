import 'package:flutter/material.dart';
import 'package:peer_money/models/screenIndex.dart';

class BaseWidget extends InheritedWidget {
  final ScreenIndex screenIndex;
  final Widget child;

  BaseWidget({required this.screenIndex,required this.child}) : super(child: child);

  static BaseWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<BaseWidget>();

  @override
  bool updateShouldNotify(BaseWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return screenIndex != oldWidget.screenIndex;
  }
}