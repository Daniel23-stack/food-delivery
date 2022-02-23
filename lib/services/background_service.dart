import 'package:rxdart/rxdart.dart';

class BackgroundService {
  static BehaviorSubject<bool> refreshOrderBehaviorSubject =
      BehaviorSubject<bool>();

      //
  static Stream<bool> get refreshOrderStream {
    if (refreshOrderBehaviorSubject == null) {
      refreshOrderBehaviorSubject = BehaviorSubject<bool>();
    }
    return refreshOrderBehaviorSubject.stream;
  }
}
