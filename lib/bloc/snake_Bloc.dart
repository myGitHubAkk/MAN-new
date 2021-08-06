import 'dart:async';

enum SnakeDirection {
  up,
  down,
  left,
  right,
}

class SnakeBloc {
  final _inputEventController = StreamController<SnakeDirection>();
  StreamSink<SnakeDirection> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<List<int>>();
  Stream get outputStateStream => _outputStateController.stream; 
}
