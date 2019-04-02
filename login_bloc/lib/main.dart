import 'package:flutter/material.dart';
import 'package:login_bloc/bloc/counter_bloc.dart';
import 'package:login_bloc/helper/dialog/loading_dialog.dart';
import 'package:login_bloc/helper/dialog/msg_dialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc _counterBloc = new CounterBloc();

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button:',
            ),
            StreamBuilder(
              stream: _counterBloc.counterStream,
              builder: (context, snapshot) => Text(
                snapshot.hasData ? snapshot.data.toString() : "0"
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //MsgDialog.showMsgDialog(context, 'hello', 'what');
          LoadingDialog.showLoadingDialog(context, 'loading...');
          _counterBloc.increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
