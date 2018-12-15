import 'package:flutter/material.dart';

class StaticRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("static route"),
      ),
      body: Center(
        child: Text("This is static route"),
      ),
    );
  }
}
