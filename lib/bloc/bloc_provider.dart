import 'package:flutter/material.dart';

import 'countbloc.dart';

class BlocProvider extends InheritedWidget {
  CountBloc bloc = CountBloc();
  BlocProvider({Key key, Widget child}) : super(key: key, child: child);
//  @override
//  bool updateShouldNotify(InheritedWidget oldWidget) {
//    return true;
//  }

//  这里updateShouldNotify需要传入一个InheritedWidget oldWidget，但是我们强制返回true，所以传一个“_”占位。
//  @override
//  bool updateShouldNotify(_) =>true;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CountBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bloc;
}
