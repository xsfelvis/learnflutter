import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//void main() => runApp(MyApp());

class SimpleProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      //      <--- ChangeNotifierProvider
      create: (context) => MyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Simple Provider')),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              MyButton(),
              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Consumer<MyModel>(
                    //                  <--- Consumer
                    builder: (context, myModel, child) {
                      print("provider ClickBtn Rebuild");
                      return RaisedButton(
                        child: Text('Do something'),
                        onPressed: () {
                          myModel.doSomething();
                        },
                      );
                    },
                  )),
              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel>(
                  //                    <--- Consumer
                  builder: (context, myModel, child) {
                    print("provider showTx Rebuild");
                    return Text(myModel.someValue);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final myModel = Provider.of<MyModel>(context, listen: false);
    print("provider ClickBtn Rebuild");
    return RaisedButton(
      child: Text('Do something'),
      onPressed: () {
        myModel.doSomething();
      },
    );
  }
}


class MyModel with ChangeNotifier {
  //                          <--- MyModel
  String someValue = 'Hello';

  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
    notifyListeners();
  }
}
