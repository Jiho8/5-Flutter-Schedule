import 'package:hive/hive.dart';

class SplashController {
  final Box splashBox = Hive.box('splashBox');

  bool get visited => splashBox.get('visited', defaultValue: false);

  void setVisited() {
    splashBox.put('visited', true);
  }
}
