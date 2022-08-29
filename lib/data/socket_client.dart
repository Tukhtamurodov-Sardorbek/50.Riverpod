abstract class WebsocketClient {
  Stream<int> getCounterStream([int initValue]);
}

class FakeWebsocket implements WebsocketClient {
  @override
  Stream<int> getCounterStream([int initValue = 0]) async* {
    int i = initValue;
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield i++;
    }
  }
}