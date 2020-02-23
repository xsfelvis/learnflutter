import 'package:flutter/material.dart';
import 'package:learnflutter/bloc/bloc_provider.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: StreamBuilder(
            // 监听Stream，每次值改变的时候，更新Text中的内容
            stream: bloc.value,
            initialData: 0,
            builder: (context, snapshot) => Text(
                  "You hit me: ${snapshot.data} times",
                  style: Theme.of(context).textTheme.display1,
                )),
      ),
      floatingActionButton: FloatingActionButton(
        // 每次点击按钮，更加_counter的值，同时通过Sink将它发送给Stream；
        // 每注入一个值，都会引起StreamBuilder的监听，StreamBuilder重建并刷新counter
        onPressed: () => bloc.increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}
