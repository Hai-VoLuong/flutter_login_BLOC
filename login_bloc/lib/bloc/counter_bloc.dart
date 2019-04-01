import 'dart:async';

class CounterBloc {
  int _counter = 0;

  StreamController _counterStreamController = new StreamController<int>();
  Stream get counterStream => _counterStreamController.stream;

  void increment() {
    _counter += 1;
    _counterStreamController.sink.add(_counter);
  }

  void dispose() {
    _counterStreamController.close();
  }
}