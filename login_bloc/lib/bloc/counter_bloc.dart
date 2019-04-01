import 'dart:async';

class CounterBloc {
  int _counter = 0;

  StreamController _counterStreamController = new StreamController<int>();
  Stream get counterStream => _counterStreamController.stream.transform(_counterTransformer);

  // change value
  var _counterTransformer = StreamTransformer<int, int>.fromHandlers(handleData: (data, sink) {
    data += 10;
    sink.add(data);
  });

  void increment() {
    _counter += 1;
    _counterStreamController.sink.add(_counter);
  }

  void dispose() {
    _counterStreamController.close();
  }
}