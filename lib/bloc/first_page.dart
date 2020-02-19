import 'package:flutter/material.dart';
import 'package:learnflutter/bloc/bloc_provider.dart';
import 'package:learnflutter/bloc/second_page.dart';

class FirstPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: StreamBuilder<int>(
            initialData: 0,
            stream: bloc.value,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text(
                'You hit me: ${snapshot.data} times',
                style: Theme.of(context).textTheme.display1,
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SecondPage())),
      ),
    );
  }
}
